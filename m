Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 4/4] clk: pistachio: correct critical clock list
To: Govindraj Raja <govindraj.raja@imgtec.com>, linux-mips@linux-mips.org,
 linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <1438964413-18876-1-git-send-email-govindraj.raja@imgtec.com>
 <1438964413-18876-5-git-send-email-govindraj.raja@imgtec.com>
Cc: Zdenko Pulitika <zdenko.pulitika@imgtec.com>,
 Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>,
 Andrew Bresticker <abrestic@chromium.org>,
 James Hartley <James.Hartley@imgtec.com>,
 Damien Horsley <Damien.Horsley@imgtec.com>,
 James Hogan <James.Hogan@imgtec.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Ezequiel Garcia <ezequiel.garcia@imgtec.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <55C5E956.5060308@cogentembedded.com>
Date: Sat, 8 Aug 2015 14:34:46 +0300
MIME-Version: 1.0
In-Reply-To: <1438964413-18876-5-git-send-email-govindraj.raja@imgtec.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello.

On 8/7/2015 7:20 PM, Govindraj Raja wrote:

> From: "Damien.Horsley" <Damien.Horsley@imgtec.com>

> Current critical clock list for pistachio enables
> only mips and sys clocks by default but there also
                                                ^ are

> other clocks that are not claimed by anyone and
> needs to be enabled by default.

> This patch updates the critical clocks that needs
> to enabled by default.
     ^ be

> Add a separate struct to distinguish the critical clocks

    Need colon here.

> one is core clock(mips) and others are from periph_clk_*

> Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> Signed-off-by: Damien.Horsley <Damien.Horsley@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>

MBR, Sergei
