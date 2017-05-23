Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170520055430.GU12920@tuxbook>
References: <1493898841-20583-1-git-send-email-varada@codeaurora.org>
 <1493898841-20583-2-git-send-email-varada@codeaurora.org> <20170510224355.GE45273@Bjorns-MacBook-Pro-2.local>
 <1f4c9974-f6a4-bee7-4f37-ad8795e442a3@codeaurora.org> <20170514042307.GE69278@Bjorns-MacBook-Pro-2.local>
 <7afc7191-bcb1-a566-eac5-a4fe1293c773@codeaurora.org> <20170517193315.GF12920@tuxbook>
 <f5a3da8b-c3a4-3cb3-9f5f-0cbdb87688ed@codeaurora.org> <20170520055430.GU12920@tuxbook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2017 11:26:24 +0200
Message-ID: <CACRpkdaiXq9ivmPOcAS4UVM-7Fz1aPYuqPw5bOHjOn2PJvSKzw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: qcom: Add ipq8074 pinctrl driver
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Varadarajan Narayanan <varada@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Manoharan Vijaya Raghavan <mraghava@codeaurora.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Michael Turquette <mturquette@baylibre.com>, sjaganat@codeaurora.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>,
	linux-clk <linux-clk@vger.kernel.org>, David Brown <david.brown@linaro.org>,
	absahu@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>,
	Sricharan R <sricharan@codeaurora.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 20, 2017 at 7:54 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Thu 18 May 01:39 PDT 2017, Varadarajan Narayanan wrote:

>> There are 18 pins. 15 pins are common between LCD and NAND. The QPIC
>> controller arbitrates between LCD and NAND. Of the remaining 4, 2 are for
>> NAND and 2 are for LCD exclusively. We plan to group the qpic pins into 3
>> groups namely, qpic_common, qpic_nand and qpic_lcd. Is that ok?
>>
>
> If you consider that you are defining the available functions for this
> pinmuxer and then define the sets of pins exposing these available
> functions it does make sense to just name it "qpic".
>
> I think that naming them _common, _lcd and _nand is just adding
> confusion when it comes to writing the dts files.
>
> @Linus, do you have a different preference here?

No I pretty much trust the driver maintainer to know this best.

Yours,
Linus Walleij
