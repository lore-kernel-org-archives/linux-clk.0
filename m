Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 2/6] clk: lpc32xx: pr_err() strings should end with
 newlines
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, sboyd@codeaurora.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        ysato@users.sourceforge.jp, slemieux.tyco@gmail.com,
        vireshk@kernel.org
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
 <1dddfd71153339875c7bedf6e562483607180a4d.1511505932.git.arvind.yadav.cs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <9a9fda0f-6da5-a6c3-439a-01db44f171b9@mleia.com>
Date: Sat, 25 Nov 2017 10:59:45 +0200
MIME-Version: 1.0
In-Reply-To: <1dddfd71153339875c7bedf6e562483607180a4d.1511505932.git.arvind.yadav.cs@gmail.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Arvind,

thank you for the change.

On 11/24/2017 08:55 AM, Arvind Yadav wrote:
> pr_err() messages should end with a new-line to avoid other messages
> being concatenated.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
