Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317119;
	b=w/fkNgSG2J1A5HtPtVopjdTKJcn6HL9ry8ORuVKi89NfN3doReADb1MJ3bZ5/1JMnfOn
	 QcfHzIhuYNOnC7UtFqJ0YHwSCBHSvJGvRVSUl9g5x1xl1UYuXrP+yjhx/QDT1UyUf250O
	 fRB7SAvjk60fLQS4Y86zp8ra6JKiOis53m0DCiALeURSJu75ryreZKWyquyw6hqmB0I62
	 k9vtCml9WWXoAPel59aH6Me10KqhC8SceO+dKTgI/Be07EMt6zS2GONinHwnHOHL2eegW
	 2qM0f/Crayuq9d9ylrMdc9yxroe4DirsiLmv8oDUBhXj1dXfXAHedg8CT+Vn62pjI+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317119;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ebtf6KHILfD8LLt9XRof6rEPvHJdF5mePUCzuh3M8zI=;
	b=WIGDsEerPcc1mWn8c4qI/+Lg8AO6na9B6+i2bIuA2yAvcTGBttZ7ETkOWm4EclVGDlSY
	 VkrHYmlBzqquvatc7PRSAHs75SnIyrsOcG6urjEzAzLAtoZWYV8aAeNT++jQwLKIU6Ts0
	 MigBgl5NyI6zUqXmBYI65okQm4+663B7qGPFZKBaTLWr1fsthJyYjySRxv7Ng8xTS5DHE
	 2xy24EAwoMGCAb+4MJZ2GSB43GrNyLi6jSNbir74cYUMqeFdXJ+LvWFPs8XeT39TTkpSd
	 uJskHvLPmsmkZhgaQNkop2B5tLWpXf2P9XT+VESKQDlyAoBVRgwRQdqAlygqGqzT8yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/WuERXK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C76606A31C;
	Tue, 10 Nov 2026 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/WuERXK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D441F008A1;
	Tue, 10 Nov 2026 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317118;
	bh=ebtf6KHILfD8LLt9XRof6rEPvHJdF5mePUCzuh3M8zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D/WuERXKsCXFJ6W/1uA4A4dNpaoGOxY+V0vAhlaP1j6zExIxwgFimKyiT4PB6sCvp
	 72/oFccw/sA5dAu9bzKZNN+//qDLDbAGW7w/HwAELnMVqcee92OVElaEzXL9grTcqn
	 DbfNxfchMqUarbVupXNlNFRImr+F5rqDD9Zjy4b8hs2UpoKrlX+9pqhXFUztVlCziw
	 B4ciaAGSsFGiOfNlybObcuvLYFPTQ8Ll1X1NO53/jV+05724zRywRL28mFMskTnKvI
	 lfcqxY0VqDIcOORjYP5P2/7iAuhL4qz9MJgV9smDLO03GL5xsFbul2T9dsih0FdRII
	 /njhDD0CV1Mig==
Date: Tue, 10 Nov 2026 14:25:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alban Bedel <albeu@free.fr>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
Message-ID: <20261110-lean-pug-of-business-cbca5e@quoll>
References: <20261110013646.1582970-1-rosenp@gmail.com>
 <20261110013646.1582970-4-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110013646.1582970-4-rosenp@gmail.com>

On Mon, Nov 09, 2026 at 05:36:43PM -0800, Rosen Penev wrote:
> AR934x has a second, high speed UART that is compatible with the
> qca,ar9330-uart one and can run from a 100 MHz clock instead of the
> reference clock. Add an ID for its clock.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  include/dt-bindings/clock/ath79-clk.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
> index eec8f399b9e6..f8a98e4d206d 100644
> --- a/include/dt-bindings/clock/ath79-clk.h
> +++ b/include/dt-bindings/clock/ath79-clk.h
> @@ -11,7 +11,8 @@
>  #define ATH79_CLK_AHB		2
>  #define ATH79_CLK_REF		3
>  #define ATH79_CLK_MDIO		4
> +#define ATH79_CLK_UART1		5
>  
> -#define ATH79_CLK_END		5
> +#define ATH79_CLK_END		6

You cannot change that, that's fixed ABI.

Best regards,
Krzysztof

