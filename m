Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55F9F0E5.7000805@kernel.org>
Date: Thu, 17 Sep 2015 07:44:53 +0900
From: Kukjin Kim <kgene@kernel.org>
MIME-Version: 1.0
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Thomas Abraham <thomas.ab@samsung.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Lukasz Majewski <l.majewski@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Kevin Hilman <khilman@linaro.org>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Anand Moon <linux.amoon@gmail.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] cpufreq-dt: add suspend frequency support
References: <1441640501-13613-1-git-send-email-b.zolnierkie@samsung.com> <20150908024659.GF26760@linux> <55EE5C79.2030604@samsung.com> <20150908042017.GJ26760@linux> <55EE6892.3010304@samsung.com> <20150908051053.GA18554@linux>
In-Reply-To: <20150908051053.GA18554@linux>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/08/15 14:10, Viresh Kumar wrote:
> On 08-09-15, 13:48, Krzysztof Kozlowski wrote:
>> Somehow my mind stuck on solving Exynos4x12 cpufreq issues.
>>
>> Right, it should go through Rafael's, probably except DTS patch (4/4)
>> because it depends on previous DTS changes. These changes are still in
>> arm-soc, not in Linus' tree [0].
> 
> That's bad :(
> 
> Anyway, 4/4 is kind of independent to this series, in the sense that
> it wouldn't harm even if it gets applied separately.
> 
> So, go ahead and apply 4/4 to Samsung's tree and rest of this can be
> picked by Rafael.
> 
Applied 4/4 into samsung tree, thanks.

- Kukjin

