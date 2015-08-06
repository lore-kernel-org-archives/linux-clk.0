Return-Path: <abrestic@google.com>
MIME-Version: 1.0
Sender: abrestic@google.com
In-Reply-To: <1438868614-7672-5-git-send-email-govindraj.raja@imgtec.com>
References: <1438868614-7672-1-git-send-email-govindraj.raja@imgtec.com>
	<1438868614-7672-5-git-send-email-govindraj.raja@imgtec.com>
Date: Thu, 6 Aug 2015 09:35:30 -0700
Message-ID: <CAL1qeaG8bP4EKEHONAEpd+8CeNBDs=NPTrPzp8nfAAiV=gGzzA@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: pistachio: Set operating mode in .set_rate
From: Andrew Bresticker <abrestic@chromium.org>
To: Govindraj Raja <govindraj.raja@imgtec.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org,
	Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, Zdenko Pulitika <zdenko.pulitika@imgtec.com>,
	Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>,
	James Hartley <James.Hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>,
	James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Govindraj,

On Thu, Aug 6, 2015 at 6:43 AM, Govindraj Raja
<govindraj.raja@imgtec.com> wrote:
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
>
> This commit sets operating mode of fractional pll based on
> the value of the fractional divider. Currently it assumes that
> the pll will always be configured in fractional mode which may not be
> the case. This may result in the wrong output frequency.
>
> Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>

This seems like it should also be squashed with patch 3/6 (i.e. there
need only be a single patch to add integer-mode support to fractional
PLLs).
