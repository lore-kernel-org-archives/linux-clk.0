Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DDF38B15F
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038378; cv=none; b=YyCuS6K4vCwwMWxTgfH/pY7i4RUPZea59zi1cZv+0WRm1PGZpTE6Oxj80lhOuHHm34WitgOhHSRIFtKZxs47DyCIFnaQH7fNdlhvv4z0pxPjeo6+GraGB/UNjNtZmcXF9bxddqTi7GMtXJmPDwGhFvDAOe+s+m850E44E2e57Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038378; c=relaxed/simple;
	bh=koZZaqymAh5kIvdpCwiZv1PBzDpj/zf5HXiHOUdGIX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnYc3f2W+FsqsFZYLC5w8xE8DnW32ly7LxEPkL2mPTfzxY2orND7J6cLf5/G0eYcn9C3HDbuu0ehK43mIW3cWPZzv2HK19Unmqb2njjUmgoPcAfuW8vAwd/QedPn+bwkO1qkF73+oZQq5NmyA1rtrV1cBuaMH2na22Bm/V/u4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so11961304a12.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038369; x=1777643169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLliIgC7Zznw0AlYmN91F7ir4F1HBOk7zj2xfpT4/Jc=;
        b=O9npI5MjdB7nx+onjQ2spAyedcTnyMEeeXIez4Ja/18JsKLcRy4DiFi0eCj+dNP+yG
         jmoJiTdEBRZzW28/052q5OMkfhTOvEpRbcXsmlRq0OJD2Vfm955ra6qKnDzDkmxCZhdt
         3TiwDQenyFNkEsRl9fr7Ge1sFQZKEgZDjv5ctnv5L9v5pBYcTiy9ByfTOxjv1UoWu/w9
         bEUVMi6+xzw5AUa/27PKpxR0J/0No0Inf4HsDBdLvN1i+aFDuej1jQXvU8cG/xtK4shl
         onwNqKPTgVOqmCL/ReF9DkOjBrDTKvRcSqGZ+h15kLUYMncd3qRAEsO4q+1zyjOb6jp8
         53pA==
X-Forwarded-Encrypted: i=1; AFNElJ8UutoA8W69wexIUXcFqdESmE99X9UV81wAQjUeWcDjWHP9Bat8BxcUwoq+65aClcqmtZZGe6ztVaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUIztU66giGUpiDCClrQDFyH/nJo9JkB/3lSTxly1QcexGbrPW
	ULJAJBlSWj3fHjczm+cAbQhXHEwr6lz4dXzvfFXRodMII45EoObAZHtQgulPB04FCqk=
X-Gm-Gg: AeBDiesM5AIzCmbgBvwZ9U3c/e3+OiGL4CvZm7o0rSBlRcgnlZYFiCqk2GI8B/EkOG6
	QSOyDVZa9VQ16kwPUfjjIociwdIT2mrXLTruRRs/E/RI0rdORcJTfcXrcOM3LrnaDxu/ixfBnNq
	H8/yMF/Muh2F2Ld4LpMGbR7qZETfP/SP3I5ZhJ9ZZxvpswKQ0MKwdEY2LIRP/ULBmP8WR+n/s2d
	vBMVz6CBVd1QHgdPnlllKrNFX9rjhZhcT71xmSXStJGZFu4qYHPUIOvQ4RxpV0KZ5nePlTAGpFj
	I64PxxOtJ/x3Xjcenrv9zxc4X6RmPa2NLZMqPCpBGZscugYp1Ne3jBCD/aBnG1QHfUZHhFR/lI9
	nHacnoyQzHttb4XyFS6CNnAPu01j8JIvI/TqEvz74EI+VH/Zpzp4OH5I7FsgTxbpwYu/AIPH6tQ
	Jpan7jtRh+ycd+gmuZ03iNnYQ5Nc3ZnSdwDPAMHp6/PJ+ROAVAfk8ffmtlrYYKaDa4xd8SenQ=
X-Received: by 2002:a17:907:7ba7:b0:b98:5648:e68a with SMTP id a640c23a62f3a-ba41adfb426mr1574543866b.36.1777038368871;
        Fri, 24 Apr 2026 06:46:08 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d455e9sm5375878a12.14.2026.04.24.06.46.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:46:07 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1183131166b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87+9M+fzzpQTq/y9qQdLAMwwFNxZ92ihz0ajBzZKt60N9b565xJBhO0wELad2y1wtUAaEREtlRWmk=@vger.kernel.org
X-Received: by 2002:a17:907:268b:b0:ba5:1970:2bb6 with SMTP id
 a640c23a62f3a-ba519702c56mr1350019066b.34.1777038366261; Fri, 24 Apr 2026
 06:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:45:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb7o3NJWjNeMvtTqoMZtZJc8e-8AGAd=WYeMa-qhgk2w@mail.gmail.com>
X-Gm-Features: AQROBzCeUf1K_8djXszLWSG49-1ZmjC232gBnM75vFZ9xuQJc1mtkXTcurZTMVs
Message-ID: <CAMuHMdXb7o3NJWjNeMvtTqoMZtZJc8e-8AGAd=WYeMa-qhgk2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock
 on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add ztr/zt clock at the end of the list to match bindings
> V3: Keep only the trace clock DT part here, extend the commit message.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
