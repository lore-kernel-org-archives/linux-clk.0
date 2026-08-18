Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A93E51C6;
	Tue, 18 Aug 2026 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050238; cv=none; b=ddAvfQYk1qOfMztZg9qHD8gcv1AHaE+AwmLtXBOJU48M6vHydafeVmbojVDEw3thgGe+egBBjyzrOLp2r3iYqa0foE6xGhGAFsJJYJw9/AAG7hvjFCihguteiQAwkk0F9dQaJ/Za6m9vUlPYqqv1dNCNYuH49dgqftRo58TcWYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050238; c=relaxed/simple;
	bh=ukeAnrFUnEaFB67xWoMtzDe2NJR1Ye/E7VSDPav/9Uo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pXuRf9KGICOiLs122Y8mD87MhxiHsQsvPkncts4ebbekKli+OnPbwwL0xvJRgrvQZwoXCTYhUjn+YH3LjuYVpE9QLdRUdrfo8xGPxIK96jN618vCoa62pnJNmflm+ZDzec82WBMaek6XudItPPUnp5KYUW/1nBL7Yb0+L2P/ZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJBJct26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJBJct26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9AF1F000E9;
	Tue, 18 Aug 2026 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050236;
	bh=e/BH2rhV5+vNQbNxRVBT4KB9khlkAcUCmii8rRZ43r0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LJBJct26IroG6BctuSkozmEux2NxxFjVnMNv8qR3Ua7ipi+K2EAJVCbq/scTFk0A2
	 wx/GnD8k9OA599v7oOBfMA15tTjX+4EKQhLFpDYMU5EfRyc7/dksMSraJF1OdQlyjs
	 6AV0qp2G6zVG8fr1+XmGK/cEGI/n/yZ6JkB9jHhZ9d53UYH56pNSzXzB4I9MOwHNLJ
	 E0n/gdU65yQ24H/HnqwTNiC7prDwhbgT4/fvbhM1KUMWj7upSGvN+1TNYZL7cp1Bks
	 lMhvGwovToGRSkJt6zdpm0G3E03PhJVYLmnAHNHIPLoLNfmuwfcvRUdqe50tMlE0aM
	 KOtsmw62uf1MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/12] serial: 8250: add Ambarella UART driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:50:35 +0000
Message-Id: <20260818105036.0A9AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Data race on up->ier and premature hardware interrupt enablement i=
n ambarella_startup().
- [Medium] Silent drop of accumulated UART error and break status in ambare=
lla_idle_enter().
--

--- Patch [10]: [PATCH v5 10/12] serial: 8250: add Ambarella UART driver ---
commit 766436c7b1daf21bb460e72b46363bc9a4c0f145
Author: Long Zhao <longzhao@ambarella.com>

serial: 8250: add Ambarella UART driver

This patch adds an 8250 platform driver for Ambarella CV75 instead of claim=
ing
snps,dw-apb-uart compatibility.

> diff --git a/drivers/tty/serial/8250/8250_ambarella.c b/drivers/tty/seria=
l/8250/8250_ambarella.c
> new file mode 100644
> index 0000000000000..951355e19fa25
> --- /dev/null
> +++ b/drivers/tty/serial/8250/8250_ambarella.c
[ ... ]
> +static int ambarella_idle_enter(struct uart_port *p)
> +{
[ ... ]
> +	status =3D serial_lsr_in(up);
> +	if (status & UART_LSR_DR) {
> +		readl(p->membase + (UART_RX << p->regshift));
> +		up->lsr_saved_flags =3D 0;

[Severity: Medium]
Will this unconditionally clear any pending parity, framing, overrun errors,
or break conditions accumulated in lsr_saved_flags by the preceding call
to serial_lsr_in()? If so, this could prevent the interrupt handler from
reporting these conditions to the upper layers, resulting in lost break
signals.

> +	}
> +
> +	if (readl(p->membase + (AMBARELLA_UART_USR << p->regshift)) &
> +	    AMBARELLA_UART_USR_BUSY) {
> +		ambarella_idle_exit(p);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int ambarella_startup(struct uart_port *port)
> +{
> +	struct uart_8250_port *up =3D up_to_u8250p(port);
> +	int ret;
> +
> +	ret =3D serial8250_do_startup(port);
> +	if (ret)
> +		return ret;
> +
> +	up->ier |=3D AMBARELLA_UART_IER_ETOI;
> +	serial_port_out(port, UART_IER, up->ier);

[Severity: High]
Does modifying up->ier and writing it to UART_IER here without holding
port->lock cause a data race with concurrent console writes
(e.g., serial8250_console_write()), which also manipulates interrupts under
the lock?=20

Additionally, doesn't writing the IER register here defeat the 8250 core's
intentional deferral of interrupt enablement? The core typically defers
writing to UART_IER until set_termios to avoid swamping the interrupt handl=
er
before the FIFOs are configured.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D10
