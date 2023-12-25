// BaiKtra_Test.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "BaiKtra_Test.h"

#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;                                // current instance
WCHAR szTitle[MAX_LOADSTRING];                  // The title bar text
WCHAR szWindowClass[MAX_LOADSTRING];            // the main window class name

// Forward declarations of functions included in this code module:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);
HMENU hMenu;
HPEN hPen;
HBRUSH hBrush;
int hinh;
int mauNen;
int mauVien;

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPWSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // TODO: Place code here.

    // Initialize global strings
    LoadStringW(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
    LoadStringW(hInstance, IDC_BAIKTRATEST, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_BAIKTRATEST));

    MSG msg;

    // Main message loop:
    while (GetMessage(&msg, nullptr, 0, 0))
    {
        if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    return (int) msg.wParam;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
    WNDCLASSEXW wcex;

    wcex.cbSize = sizeof(WNDCLASSEX);

    wcex.style          = CS_HREDRAW | CS_VREDRAW;
    wcex.lpfnWndProc    = WndProc;
    wcex.cbClsExtra     = 0;
    wcex.cbWndExtra     = 0;
    wcex.hInstance      = hInstance;
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_BAIKTRATEST));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_BAIKTRATEST);
    wcex.lpszClassName  = szWindowClass;
    wcex.hIconSm        = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

    return RegisterClassExW(&wcex);
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   hInst = hInstance; // Store instance handle in our global variable

   hMenu = LoadMenu(hInstance, MAKEINTRESOURCE(IDR_MENU2));

   HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, nullptr, hMenu, hInstance, nullptr);

   if (!hWnd)
   {
      return FALSE;
   }

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE: Processes messages for the main window.
//
//  WM_COMMAND  - process the application menu
//  WM_PAINT    - Paint the main window
//  WM_DESTROY  - post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)
    {
        static int x, y, x1, y1;
        static POINT pointSao[8];
        static HDC hdc;
        case WM_LBUTTONDOWN:
            x = LOWORD(lParam);
            y = HIWORD(lParam);
            break;
        case WM_LBUTTONUP:
            x1 = LOWORD(lParam);
            y1 = HIWORD(lParam);
            hdc = GetDC(hWnd);

            if (mauNen == 1) {
                hBrush = CreateSolidBrush(RGB(0, 255, 0));
            }
            else if (mauNen == 2) {
                hBrush = CreateSolidBrush(RGB(0, 255, 255));
            }

            if (mauVien == 1) {
                hPen = CreatePen(PS_DASHDOT, 1.5, RGB(255, 0, 0)); 
            }
            else if (mauVien == 2) {
                hPen = CreatePen(PS_DASHDOT, 1.5, RGB(0, 255, 255));
            }
            
            SelectObject(hdc, hPen); // ap dung but ve
            SelectObject(hdc, hBrush); // mau nen

            if (hinh == 1) {
                Rectangle(hdc, x, y, x1, y1);
            }
            else if (hinh == 2) {
                pointSao[0].x = (x + x1) / 2;
                pointSao[0].y = y;
                pointSao[1].x = x + 5 * (x1 - x) / 8;
                pointSao[1].y = y + 3 * (y1 - y) / 8;
                pointSao[2].x = x1;
                pointSao[2].y = (y1 + y) / 2;
                pointSao[3].x = x + 5 * (x1 - x) / 8;
                pointSao[3].y = y + 5 * (y1 - y) / 8;
                pointSao[4].x = (x + x1) / 2;
                pointSao[4].y = y1;
                pointSao[5].x = x + 3 * (x1 - x) / 8;
                pointSao[5].y = y + 5 * (y1 - y) / 8;
                pointSao[6].x = x;
                pointSao[6].y = (y + y1) / 2;
                pointSao[7].x = x + 3 * (x1 - x) / 8;
                pointSao[7].y = y + 3 * (y1 - y) / 8;
                Polygon(hdc, pointSao, 8);
            }
            else if (hinh == 3) {
                Ellipse(hdc, x, y, x1, y1);
            }          
            
            ReleaseDC(hWnd, hdc);
            break;
    case WM_COMMAND:
        {
            int wmId = LOWORD(wParam);
            // Parse the menu selections:
            switch (wmId)
            {
            case ID_HINH_CHUNHAT:
                hinh = 1;
                break;
            case ID_HINH_SAO:
                hinh = 2;
                break;
            case ID_HINH_ELIP:
                hinh = 3;
                break;
            case ID_MAUNEN_XANHLACAY:
                mauNen = 1;
                break;
            case ID_MAUNEN_XANHNUOCBIEN:
                mauNen = 2;
                break;
            case ID_DUONGVIEN_DO:
                mauVien = 1;
                break;
            case ID_DUONGVIEN_XANHNGOC:
                mauVien = 2;
                break;
            case ID_HINH_THOAT:
                if (MessageBox(hWnd, TEXT("Ban co muon thoat?"), TEXT("Hoi"), MB_ICONQUESTION | MB_YESNO) == IDYES)
                    DestroyWindow(hWnd);
            case IDM_ABOUT:
                DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
                break;
            case IDM_EXIT:
                DestroyWindow(hWnd);
                break;
            default:
                return DefWindowProc(hWnd, message, wParam, lParam);
            }
        }
        break;
    case WM_PAINT:
        {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hWnd, &ps);
            // TODO: Add any drawing code that uses hdc here...
            EndPaint(hWnd, &ps);
        }
        break;
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProc(hWnd, message, wParam, lParam);
    }
    return 0;
}

// Message handler for about box.
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }
        break;
    }
    return (INT_PTR)FALSE;
}
