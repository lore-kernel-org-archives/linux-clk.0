Return-Path: <viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20180402091617.GA3572@vireshk-i7>
References: <1522358807-10413-1-git-send-email-ilialin@codeaurora.org>
 <1522358807-10413-9-git-send-email-ilialin@codeaurora.org> <20180402091617.GA3572@vireshk-i7>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 4 May 2018 11:34:04 +0530
Message-ID: <CAKohpo=cw+2Leuwa6XjEYh4kVYK093A5eckUmPBDutgqeqpvog@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] dt: qcom: Add opp and thermal to the msm8996
To: Ilia Lin <ilialin@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
	Linux Clock List <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"Nayak, Rajendra" <rnayak@codeaurora.org>, Amit Kucheria <amit.kucheria@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, celster@codeaurora.org,
	tfinkel@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 2 April 2018 at 14:46, Viresh Kumar <viresh.kumar@linaro.org> wrote:

>> +     cluster0_opp: opp_table0 {
>> +             compatible = "operating-points-v2";
>> +             opp-shared;
>
> Is Kryo like krait where CPUs do DVFS independently ? If yes, then opp-shared
> thing should be dropped.

Have you ever replied to this question ? Sorry, but I am not able to
find it in my inbox :(
