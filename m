Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4AC327204
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127857; cv=none; b=o+kp0Cuj+/tKJ0WRRbd26tp4IstmwS6qUkPbpAWxDpfqj2dqY9HAI44ME0mUoCS4Gzy4IJuGzACoYWm+eAmDHcr3yddmcj90rtOcIUJbH2kEwEXzFRsnSygGdc51H4SoPp6xZ/C7mtWB9iECumta71fjRHzMLOwGSTBY9k85fyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127857; c=relaxed/simple;
	bh=IbClSHn9aZpuXM+ascH2qq0OXmxbXPfvR5uGqXwLbYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFcJN3sMOfWJ3oFtjNatdbB5twYErvhSTuTnjP9mIcRzruS8/gke0ahhff7h8Gv3cYXYUoXTUGIOLwJEQDPLfUTN3mtIUmNB8U4FPoWQOHb9pvhmvP67iVFLn7rVaZ4c0Awr4Alyn7dANaLJ8VAjcLmnPDvWNZjFR8jOFNfTLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQRVxtck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQRVxtck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D301F0155B
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786127850;
	bh=q3xxa/UfKWm1lC1tilX+p+SRJDIy4wByBvzeQKGwW04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KQRVxtckuLH/m7yt3Iktutu+xJ4K2kgbvJM3L3zEwZBuKeQfR092h5gGUV4/yo+t7
	 mMSv02m9Rh9TJ0u6Jiv+3E2lS91YwCEdb7G6zaFDJiYsBflX2rmA56BEJE0VtB2XzV
	 qw7AvWhoAhnk7DAAmD2wjT6bj7bBoO76YlbNqGBOzpnty5YmkL3U1goFdU52IrMqte
	 EwHCgvOhpEuT3TrN9WL7+iSKogjZAm3f6UYYe0LeeviRnKzL+jJVt7wefejNzjMDeq
	 NhR8qIgzeheJndiOXOYpLO5JUZLZPJI2voSC7/x5FtVBtiMOXqr6cOQwI+O5IhCVfm
	 C7WzTRgcr4wPw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aec6360133so3137204e87.1
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 11:37:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpyN+XXZ5UltcqCCYsZHi5afxSje6ortxWrvGwor2j1HXTbZPAsBoY9ycz1xbuMeq8WLDjb/5KO4JY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7gnESQwvOp6uexjRkEKmb4t1zlGJ0mAng6MHvan4LKoZpSVlr
	qTj9b5nNvammEI1RsQm3uPKflncUMciBeXBiEQ5VPsf+7y3gG7MD3FrLL3KML+JFcoOizNGdi60
	29FYciL63pfzFKEw+aoqtrC5pKQ8PH/8=
X-Received: by 2002:a05:6512:689:b0:5b0:129c:ed76 with SMTP id
 2adb3069b0e04-5b2f4cc0f56mr3883853e87.29.1786127849010; Fri, 07 Aug 2026
 11:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 20:37:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLm6HzEU1TM-c=Vtjv3FJEBecVP7TyxSgq_Q0zF-YwT6NA@mail.gmail.com>
X-Gm-Features: AUfX_mzYw0ZkQMsDh4exCkqu18ubdjPO_uZyWXIwif8s9Ss1BlcTUbv5W-M2nk0
Message-ID: <CAD++jLm6HzEU1TM-c=Vtjv3FJEBecVP7TyxSgq_Q0zF-YwT6NA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] serial: ambarella: add Ambarella UART driver
To: longzhao@ambarella.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Long,

thanks for your patch!

I know this driver has a long history and has been refined inside
Ambarella for many years. However this is clearly an 8250
UART derivative:

On Thu, Aug 6, 2026 at 11:34=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> +#define UART_RB_OFFSET                 0x00
> +#define UART_TH_OFFSET                 0x00
> +#define UART_DLL_OFFSET                        0x00

RB, TH, DLL sharing register 0x00.

> +#define UART_IE_OFFSET                 0x04
> +#define UART_DLH_OFFSET                        0x04

IE, DLH sharing register 0x04.

> +#define UART_II_OFFSET                 0x08
> +#define UART_FC_OFFSET                 0x08

II, FC sharing register 0x08.

Compare:

include/uapi/linux/serial_reg.h

#define UART_RX         0       /* In:  Receive buffer */
#define UART_TX         0       /* Out: Transmit buffer */
#define UART_DLL        0       /* Out: Divisor Latch Low */

#define UART_IER        1       /* Out: Interrupt Enable Register */
#define UART_DLM        1       /* Out: Divisor Latch High */

#define UART_IIR        2       /* In:  Interrupt ID Register */
#define UART_FCR        2       /* Out: FIFO Control Register */

This hardware is clearly using the original 8250/16450/16550
tricks to save address space.

The only difference is that your registers are spaced out
with a register shift of 2 so 1 becomes 0x04, 2 becomes 0x08
etc.

It's not even the first doing this, e.g. the DesignWare 8250
driver does the same thing.

This needs to be rewritten using the 8250 library in the kernel
under drivers/tty/serial/8250/8250_ambarella.c
or similar.

Probably you will get much less code to maintain and a few
features for free when you do this.

Yours,
Linus Walleij
