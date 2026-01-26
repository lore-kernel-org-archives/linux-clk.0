Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD4244694
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442907; cv=none; b=XbfSx1rlDyyQ/MQMxc1YwEz+QP9fQAc0UH2VjtfIxkN6b7RABzgD7dS/N15fZ2ba1gq+affg2mvE7VoRsy2Q9GG3HrmiRohYMPyKHR2TJKqMVGH4RjOLK/dYUdN8NA7dVjSLuUH+TgKvjzyCC5acqeYb0FczjF7rgyqJf2zcVHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442907; c=relaxed/simple;
	bh=1XOij24fFL3jCp8FgItwLjml+TZ1bGZsb0l3e5RoGWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1CaOCwmfWIW5aMM8qPIKu3IpRa8+ZShcD1zvNH41wgUD2/q6NJC33J22acWnXEY4R/DEgV50Oq3F3NkIYReSNUXhkZiwjVa24CoG6pEqz52yu9YlV4kRGRi2eZ4q3oviELRoUeLCBCo71gDRKG9vjeFraBqN84RnY9OQq/+2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5665171836cso1542914e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442905; x=1770047705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfmszpDLcKM3me+QqaBglak1H7HW82219TFin6bK4Mc=;
        b=gQLFqW18txRo2tuDZ8saCn7wH8YfGe1HfaIrZTN0P+mQUOySijQ1LqTLNwm665ZamE
         SlrjQBttbdQogWrpjLCrLShJpuvxgiufdZzmhBJmA8h3wxjg0+oqOYjvPuwmiVhwWfRt
         5jcgbRZ5gKbO9f1AUFCrIVpaGosKsK+znFqOjmIgOI77QvIPsWr/x/fWem6VVh5Aco+T
         xlz5tolNFYFHGFsAJiDsMPdsPJdp509p/9p2Mvu00hH4HKYpS4ha4vVpn/puFg+AqV8Z
         UjOVCGmxoc/UKYsgO1Ez1O7WnAY8cFd6KnPu8kerSqjtdOjBDxt8sXGXCdWywaHFrIEC
         tMgg==
X-Forwarded-Encrypted: i=1; AJvYcCV7CrRzx8xu+2m5ImXVCMmPtJfAla7bFNXvvNqjn8c7jKOpeNFrNi/ronNKJ5Tr+DC4JMEnS/dmP/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcbkguzy77B87QU19JVZS0k/pMm4MsmtJBrq6K0GGPDpms4uOM
	BAu9Y/tgcGExY3vguNDyTdP9LtuL8DjCyi9iHx0MddZF3zC5lhUVm/DDAtFVmSIx
X-Gm-Gg: AZuq6aJJu1tXn7G1X8FnS0lq3TCwzowRh8EGwO3cznEEF5Gzz5hDCyAPH62c12VwqOj
	z35BTk/etptVupNlcR679uLQbaqlZ9IKNPNxHXcobrirmxSWoDHnsmqpGEy1K9vrgTJZzLbQnTA
	E2dJZvfUZ0ZMEilDCHU1KTaCQiJ3NJV/KSecCtELwh5UTs+tIokCTbtfChxcSrSzmfpu7bz6u6s
	KEkdNFvfmf8+V9GAxZL6iJ+UCqJdjZUwpAZd6uoGo0Gu7DGeRxaCbBlg9GlNK16NZ99u5qHn2sD
	nACkHNpGT7QxbJLD9iL2pMbetd1c9qNBNEP4/nFruYF/eg4NFGXK2gqhBrAdgJxtY/6eyWO2U7r
	uUPBioyc3snI2Osr6qYtsOzYi7D04YMAjTHJUdvXSXpiWg4BrJP0UrZo74VAWgNdJclq5edOwpY
	GWWpy95sbfLEVR2z0JZe4/4pkq8uiOYwj1Hw1ojcWia70M0RsQ
X-Received: by 2002:a05:6122:4d8d:b0:55f:cae4:250c with SMTP id 71dfb90a1353d-5665c9d2133mr1451677e0c.13.1769442905343;
        Mon, 26 Jan 2026 07:55:05 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa7d527sm2065101e0c.7.2026.01.26.07.55.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:55:04 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94130b88642so3795529241.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:55:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNInxc/6hPz0DdiJjI8yLsp4xXRD5np5B6Glf6bu1pn/N+OA7CtJ7tk+w7FVQDogVp3YOyPHuUP0w=@vger.kernel.org
X-Received: by 2002:a05:6102:cc8:b0:5f5:256d:c0cd with SMTP id
 ada2fe7eead31-5f5764c0342mr1772360137.34.1769442902454; Mon, 26 Jan 2026
 07:55:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:54:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCiAxhrxFnj4w3=hmMKXVggaqsbswBcCNLUaMnue0Dag@mail.gmail.com>
X-Gm-Features: AZwV_Qhbv0qDo3qYKrsna5xVdUyAWWjt9-sxoW2iEe0kNcXEgj8fU6MWgw8rCcA
Message-ID: <CAMuHMdUCiAxhrxFnj4w3=hmMKXVggaqsbswBcCNLUaMnue0Dag@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r9a09g056: Add clock and reset entries
 for RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add module clock and reset entries for the RTC module on the Renesas RZ/V2N
> (R9A09G056) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
