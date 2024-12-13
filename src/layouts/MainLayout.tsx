import NavBar from "../components/NavBar"
const MainLayout = ({children}: {children: React.ReactNode}) => {
    return <div>
        <NavBar />
        <main>
            {children}
        </main>
    </div>
}

export default MainLayout;