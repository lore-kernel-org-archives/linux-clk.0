Return-Path: <linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: meson-gxbb: Export PWM related clocks for DT
References: <1471870177-10609-1-git-send-email-narmstrong@baylibre.com>
 <20160907005208.GS12510@codeaurora.org>
Date: Wed, 07 Sep 2016 12:51:31 -0700
In-Reply-To: <20160907005208.GS12510@codeaurora.org> (Stephen Boyd's message
 of "Tue, 6 Sep 2016 17:52:08 -0700")
Message-ID: <7ha8fjtrng.fsf@baylibre.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, carlo@caione.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 08/22, Neil Armstrong wrote:
>> Add the PWM related clocks in order to be referenced as PWM source
>> clocks.
>> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
>
> With some more thought, it should go through whatever tree takes
> the dts changes. Conflicts in these header files should be
> managed by the same person and that person is the platform
> maintainer.

OK, I'll pick this up and take it through the amlogic -> arm-soc path.

Thanks,

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
