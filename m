Return-Path: <yorksun@freescale.com>
From: York Sun <yorksun@freescale.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"pmarrecas@outlook.com" <pmarrecas@outlook.com>, Mike Turquette
	<mturquette@baylibre.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
	"Andrey Filippov" <andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [Resend Patch v6] driver/clk/clk-si5338: Add common clock
 framework driver for si5338
Date: Tue, 20 Oct 2015 00:17:36 +0000
Message-ID: <CY1PR03MB14694C6FFC8BA80C08EB039ABE390@CY1PR03MB1469.namprd03.prod.outlook.com>
References: <1444410574-28677-1-git-send-email-yorksun@freescale.com>
 <20151010000948.GW26883@codeaurora.org> <562165C3.1090103@freescale.com>
 <20151016213139.GE16437@codeaurora.org> <56216E0D.4010709@freescale.com>
 <20151016230555.GE10182@codeaurora.org>
 <562553E4.30906@freescale.com>,<20151019234348.GE19782@codeaurora.org>
In-Reply-To: <20151019234348.GE19782@codeaurora.org>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Sorry for top posting. I am on outlook web.

We have no problem with device tree. Let's put it aside.

When device is not used, the platform data is used to hold the data, filled=
 by a platform device before probing the clock. For my case, the platform d=
evice is a PCIe device. It is a multifunction device with I2C controller on=
 it. The pseudo code looks like

struct i2c_board_info si5338_info[NUM_SI5338_CHIPS] =3D {
        {
                .type =3D "si5338",
                .platform_data =3D &si5338_pdata[0],
        },
        {
                .type =3D "si5338",
                .platform_data =3D &si5338_pdata[1],
        },
        {
                .type =3D "si5338",
                .platform_data =3D &si5338_pdata[2],
        },
        {
                .type =3D "si5338",
                .platform_data =3D &si5338_pdata[3],
        },
};
clk =3D clk_register_fixed_rate(&pdev->dev, "ref25", NULL, CLK_IS_ROOT, 250=
00000);
for (i =3D 0; i < NUM_SI5338_CHIPS; i++) {
    si5338_pdata[i].clk_xtal =3D clk;
    adap =3D i2c_get_adapter(private->i2c_adp->nr + 1 + i);
    private->i2c_client[i] =3D i2c_new_probed_device(adap, &si5338_info[i],=
 i2c_si5338_addr, NULL);
}

You can see, when the fixed-rate clock is registered, the device id of si53=
38 is unknown yet. (I am using one 25MHz clock to feed multiple si5338, whe=
re maybe I should create multiple 25MHz clocks, but that's another discussi=
on.)

I hope I have made it clear.

York

________________________________________
From: Stephen Boyd <sboyd@codeaurora.org>
Sent: Monday, October 19, 2015 5:03 PM
To: Sun York-R58495
Cc: linux-clk@vger.kernel.org; pmarrecas@outlook.com; Mike Turquette; Sebas=
tian Hesselbarth; Guenter Roeck; Andrey Filippov; Paul Bolle
Subject: Re: [Resend Patch v6] driver/clk/clk-si5338: Add common clock fram=
ework driver for si5338

> Stephen,
>
> I am still having difficulty to implement this. The platform device doesn=
't know
> the clock device id when probing the clock chip. For my case, the platfor=
m
> device is a PCIe device, with I2C controller on it. The clock chip is on =
the I2C
> bus. When the PCIe device is probed, it registers the parent clocks for s=
i5338
> before calling i2c_new_probed_device(). At this moment, the si5338 doesn'=
t have
> an instance yet. So the parent clock pointer(s) in platform data structur=
e
> is/are passed.
>
> I have another solution, let the platform data has clk pointer(s). The cl=
ock
> driver for si5338 will use device tree of_clk_get() if device tree is use=
d, or
> take the pointer(s) from platform data. Upon driver removal, this driver =
call
> clk_put() regardless where the pointer(s) came from. The change will be i=
n my
> platform device driver. It doesn't need to call clk_put again.
>
> Would it be acceptable?

Sorry I'm a little lost. Where does the platform data come into
the picture? Is the i2c driver going to the parent device to get
the platform data?

If we have a way to pass data to the si5338 i2c device, then I
assume we have a way to get the device name of the i2c device. If
that's true, then we can create a clk lookup structure with
clkdev_create() in the place where we have the clock pointer and
use the dev_name() of the i2c device as the third argument to
that function.

BTW, the i2c device doesn't need to call of_clk_get(), it can
just call clk_get() and pass the device pointer and it will use
the DT path if there's a provider. Please don't use of_clk_get()
when a struct device is present.

--
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
