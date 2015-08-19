Return-Path: <abrestic@google.com>
MIME-Version: 1.0
Sender: abrestic@google.com
In-Reply-To: <1439890337-13803-2-git-send-email-govindraj.raja@imgtec.com>
References: <1439890337-13803-1-git-send-email-govindraj.raja@imgtec.com>
	<1439890337-13803-2-git-send-email-govindraj.raja@imgtec.com>
Date: Wed, 19 Aug 2015 14:06:22 -0700
Message-ID: <CAL1qeaFDaw3ywkdwGZi1=W+=Kmi=AAEMBx0tEJJ84q1Re3tiFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] clk: pistachio: Fix 32bit integer overflows
From: Andrew Bresticker <abrestic@chromium.org>
To: Govindraj Raja <govindraj.raja@imgtec.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>,
	Ralf Baechle <ralf@linux-mips.org>, James Hartley <James.Hartley@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 18, 2015 at 2:32 AM, Govindraj Raja
<govindraj.raja@imgtec.com> wrote:
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
>
> This commit fixes 32bit integer overflows throughout the pll driver
> (i.e. wherever the result of integer multiplication may exceed the
> range of u32).
>
> One of the functions affected by this problem is .recalc_rate. It
> returns incorrect rate for some pll settings (not for all though)
> which in turn results in the incorrect rate setup of pll's child
> clocks.
>
> Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>

Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
