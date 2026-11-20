Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201481;
	b=Mr6vgClpVQgaLr4UoJrd3XoiEkRGA1t6YEqneT+f4RwBwrrv0SezPVgJO/X+QkxeDKJh
	 IRFrPpu0K7oShD4DK/lm7oApzQNFgl2MkDDrqHLC5RGe4w4vTsNsAfdShXajamAidHTZV
	 IlqMWU2tzOjFbEoiSICcMExdgaCbtJHZdEULJvEVexPvAbo/k+Pjmv851l4P2q6LDn+fK
	 ooHyEoR8wOulPyGJPaaaBvoo55TMTKRfvMmINha5n58c2saieMHW7w5tj1eEyStWKYaOt
	 +nVhfHNDGXklU65RWGaRt5kVCGxq/5O8dCUOUBZY2YmQ0ypgGDu5Nm5rbVbxQH70BNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
	b=16ur5HmRCKs5pM1F5+KVb0aWNp3hgjS4dcJsh49CCq3yG+Xpqo9tzshFDQcfrja1v7GC
	 lCG01w9W2QwijV+PSYY5D3MAkTaa8Np2s/MD+rRFi6KJD36/crrDi+clACyt63lVn/RcP
	 T6Brp2RDHaWoO1oFSCedPHhMmx0h0Mzegd+EUWN3ab30SiRJG37mOP3P+QfjjE6RGLwQn
	 a8NxoFDcObDGqzd86/AYGjdLwQKY7KtrLTHwxlvFUVO2wOLLQ2bCBYJ/cvOjqDCXVEFf7
	 DJQmnxQ6szPexvolEMDmDuKlyKplLQGWmGDm5tUwTEjN8c8nxZWkFsd6t2pozT7ej4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=JLrvzWrj;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA260A261F
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDEA260A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=JLrvzWrj
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-571eb508e44so652134b6e.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795201470; x=1795806270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
        b=JLrvzWrjv1Foo6HYSfTDQVhyxDufy62fACyY4TUuvVaXgUa8lSg6ccU7ISvUaCI27H
         XwtX20FM0lAco9h28TTdGDJhvnP9d5NX+97YXXXWpfbFUFWZDBvFgg0CG7FJ6fqC6xii
         L0UBMr7K6SzVuWyOSuC+n3EjKbo93TyJbcZGK6sRvqWpJEBbQYZwztZIOHeCYvQ/fsrb
         7JC1ZqV0uo6I0urwInXjmsBf3Wbk3RFBF5WWgi3xER0qNs+Rn9fLAbWzqDHFsWJt7BcC
         kNuMepTIGP5jkW7TM25coWgEjy4zyRZOe5lWrtuJf5pOEYx3Ep22hoon3Z4TQnVX7O2U
         N8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201470; x=1795806270;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
        b=x4KPCJOVEQ/h2hn2n6DKSU2vDtWNPTTaegd/3cx1Ix4HxTGjm2DTzsOoh4E1xUfhS3
         YsZk01awU5LUvMgjfIOwVGz7WLvWXRMLzTVqNThsc3goFzgdMEnbCIhwH8blvMerv6xh
         7bxYripR4A0t4WVqsZWT0qEvP+IhFHQqcX5W1J1vACMBVIr4gnzLQU3Yiml/Log3/XZ2
         0RC0FMKHXtFc+CsaP/bWADfKuWyHzDbjYBFSC1O3CtsmKqfzqDqi4AyW2wz60rMdvHbA
         BO/BP0NzRtxvU+X7fkuzD8nB0XkuDghk+XPVLKHUvR6PRU33bsXLE0iLj+PFYH5sZzVX
         y1cg==
X-Forwarded-Encrypted: i=1; AL+hErHzuWQhGfNG86Ou3CJOGesIuudYx6eKK6Dw7tqW2kcGOcd+1HNqRzuu+wBAg2weUvoaCbGm76A+j/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vek7jvqDN5KJKZjT5RWeFC+5zMuPd183GDl1VPOZfHi1hak3N
	AMd6cpg4kDDE6p5ltop/V5hTxn92wgCO/C2bdahB5s1Gp2Fq5SHv3kJPtbYFgRTUy8g=
X-Gm-Gg: AYBFou3Fr9sV4hqjvMGsFKkszDc1F4i5LDYOhRcnto5iMSdwJQ7LH1yXC7RT/EdxfY+
	7x24E34WHwHZuEsmI8gXZLfWS3J93Z6dfPpCzojHS1mImXxZBt9kRdJQhWLMwMzdboTBJi3uIO2
	i6NqTO92X5Zi2DtMuUd+sWQQeUDpN5vuxmJ/FuqwGzBNJhny+rtifZMXyIi4NCv2JIcTDMHcMON
	MK5jBAsl+qUnUECWt7QbBWE35OlZ0x0Nzsp7XRbBp3pNtN7KuDrz4azqIyWPzbZYU+v5GXkf8eT
	wNcTEB397qQgz7kwo16tZcMXtXl9dSpWHvMyBuAFDPiWDKJBhBrb5bqhD6/COFKtwE767YFMI8F
	019XRHUxzU3g3w8cAtN6bDDqpJQGb/UJ5WX7e6iRkGzHGe3tTQQZeEJUR9oPwbgzyWyAD1ex9wA
	m11zdFmt6glkutybsczmx6LiuwabBXByJwokjo5yLA38w8EtBic8HFQzCuNaOB1oth9FxQsfnMU
	CWNn0iS8w+cWi2xrvuWObhrNVgcVOOzTXdbM+xo5EOVbffAA5vX8zYpcS3h2F5icELmZEjxk2vO
	VIBZglzGxRTfwMT1nN54wpbMMRThCXLZzQ==
X-Received: by 2002:a05:6808:1528:b0:4f9:a153:8446 with SMTP id 5614622812f47-57a0980a5eemr4879032b6e.38.1795201470007;
        Fri, 20 Nov 2026 11:04:30 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35655a5bsm2814524b6e.13.2026.11.20.11.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:04:29 -0800 (PST)
Message-ID: <295d75b9-b346-4669-8c1c-397df433b699@riscstar.com>
Date: Fri, 20 Nov 2026 13:04:28 -0600
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] clk: tc9564: introduce a clock and reset driver
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120183212.1264522-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261120183212.1264522-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 12:32 PM, Alex Elder wrote:
> This code has gone around and around in various forms, having been
> included most recently in a series that also added a system controller
> driver.  That system controller has now been removed.
> 
> This series introduces a devicetree binding and single driver to support
> the clock and reset components present within the Toshiba TC9564 chip.
> 
> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
> It includes a PCIe switch with three downstream ports.  To one of
> these ports an embedded PCIe endpoint is attached, and that implements
> two PCI functions.  BAR 4 for both PCI functions provides access to
> registers controlling blocks within the SoC, including the clock and
> resets controllers supported by this series.
> 
> To avoid any confusion I'm only going to refer back to the "syscon"
> series", which provides some additional information including links
> to earlier versions of this code.
> 
> 					-Alex

If anyone would like to see the DTS file that uses this clock
and reset functionality, it's available here:

  
https://github.com/riscstar/linux/commit/de0515ee2967d8ff7753cc179a8e05283ee62829

					-Alex
> 
> The previous version of this code was included in this series:
>    https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/
> 
> Between that series (v1) and this one (v2):
>    - There is no more syscon, so its devicetree binding and driver have
>      been dropped
>    - The clock and reset components now have a single devicetree binding
>    - We no longer use a syscon-generated regmap for accessing the common
>      range of memory used by multiple drivers; specific sub-ranges are
>      instead mapped
>    - The clock and reset drivers have been combined into a single driver
>      located under drivers/clk
>    - The config option for the driver includes COMPILE_TEST, as requested
>      (last month) by Jerome Brunet
>    - The help text for the config option is simplified, first suggested
>      by Philipp Zabel
>    - The driver now names clocks using dev_name() rather than trying to
>      hand-code a unique name into a fixed-size name array (also suggested
>      by Jerome)
>    - Certain functions now always return 0, which simplifies callers
>      so they can simply return what the called function returns
>    - As suggested by sashiko, a counted-by field in a flex array is now
>      assigned explicitly
> 
> Alex Elder (2):
>    dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
>    clk: toshiba: introduce a TC9564 clock/reset driver
> 
>   .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
>   MAINTAINERS                                   |   9 +
>   drivers/clk/Kconfig                           |   8 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-tc9564.c                      | 501 ++++++++++++++++++
>   include/dt-bindings/clock/toshiba,tc9564.h    |  50 ++
>   6 files changed, 642 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>   create mode 100644 drivers/clk/clk-tc9564.c
>   create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
> 
> 
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

