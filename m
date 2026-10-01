Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71503C3443
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840391; cv=none; b=GbTFfn8y+FcluVL6/8oq38hqX7QAacKHEiewwhLWqIljfCLdokPHuTrofhStNnk6erVEPpUwzBPYdBm2oghdyofesq2HbZInXDCnGDoglacbanYvyC/y73mKhJAN7cm9aahmpHIOEDYdqyWyPZXolcViWbGdVs38BAoDDkTMdhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840391; c=relaxed/simple;
	bh=FTbMRNRbU6pNDmnTAvMnM2k4t8jNkyiXXajv1gNHfcg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hecv3B7N4LLM8O6+d2tQIdz+QG8Y1Qg7BmgFsc2U0vPWFFkR03S/dgtObbJhUlxl4cazP2h5nhnQIyMGoyo/douq22kFfJR0/lWYGcrd3T2I3Sl950kv395qrX3hYFhk6o2sdwFnwZGmw6iuIWK/YS3LLahOa7wLU3eZiIdM7LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=F3wsdO1k; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="F3wsdO1k"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e20bb4583so215853366b.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 00:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790840386; x=1791445186; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aKueKOhi2EJ/sJpvwQQBAHFYrN/nshYB9lnhmsVqc00=;
        b=F3wsdO1kQySRh2Jy6hP09GeMC2lv9xgH6tZTO+y67qVVwcJ6CyqDqwwmgheJyVLQTK
         S7WbPADtRrHDHJNr3dHOM/wALHwWUpy1II2vP1IkDRXx6vDmpyiS1LvNEbDEqHLFIs3O
         fqBu6opgx/Zfc/QmvsN1Z1xRE+kbWyeZft6M18OMDmko72T091t4hoDmiDE/irhzQtdp
         OwRCa+c6MLwBclGwxqXce0TFG5VpLiaXMeDufScpCJrJViE1h+4b81osILUMudV1YAra
         Awi5q1qCeSjlRC2AyhA1KrFc9kyL8nYcZhCBLcex1QftCHFEHFfb0X6hOJfuN1Wdocgn
         RiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840386; x=1791445186;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aKueKOhi2EJ/sJpvwQQBAHFYrN/nshYB9lnhmsVqc00=;
        b=b1qpvMwvlcMuUbOw8KARbJbXmaU2nO272FofU6tlEOhfPAmkqvOjvxIVW6zJ1lowJm
         62OwRfv0ENgFX6iVOA6BqdywDgkqxGopFUWOzON8beCZKEpwLJcFncdR0e+ix2MTEFm3
         aePUD1jOhvY2CTNYcPPY4Fku/8vcPGYoTdcsg9hZqcoDKTdVbO6XLtaXpBjuyue30nYW
         mOF2HiRyWYy/3XKNzbF3AG2636DKlLwBioLCksZ0YbRnrlkBBKxoSOqfUhnIVE8vQppe
         8gT6OKe6iVqb67sKfNxJY4oPDYhm251eYbuJfcKE0pdtTTUGKodSEmzN7Is3GrT1dSj4
         0wGQ==
X-Gm-Message-State: AFuF++mERX1QSIOrAzueB2WMd2LgtxZtfu49TkHGUxu+8aMZEgYAlct9
	szH5GeCuBueYtJ/r6IJPc4G3lw4erMv0H+PPZDHT+FwfyroBjP3zFgecvq+VOp5/DRbD4bIf5WB
	tUu3/ohk=
X-Gm-Gg: AYBFou21jZeF1MbfcxQ9JcoN6Xn0FffTOgp/TeXdOtzH1/CQC3uDDRygVRkecQR834T
	9fAUfEKJxMQ6s7I/Vmow8f42q0XmVuNDPKL+F/bCwpLiwFzOtM5QieiTfTsZhIF7qWeocGPdte/
	BjwatXQLdQtFzVGM/jNDH/D64PQx2z0tviVXj1owb/F3V7klxyER2cyMMQ7blDpDpNdCXIntidd
	YeQZQpv9sLaGLA4dkw9W9dCoCxRRKlPdRYZOwb7yFX4SfNLu9dXt43ohiQQkd176CcuvwI6u5nW
	M8pnV7suBSQm8FeFm92iwJlgGbKtIIp7KHemK78Pq3U4LWLjK5c+pWUoHraghnjlqTxxkx4ARDN
	XW7hWX00F6DOc6xOfQ3ueZp6czKxJlZ/f1HSQoy2lpkw70i3FFfRrGoYUKhk9/nu6VmXu6Ka1+1
	ta/Ca+nUXgBPYpIe9vBqBLq94O9LTclqCp7XihANodfYGPKpjB31m2wcFXkxsfXoCbfW6FFaqpM
	e0/M0/LjMyw6qQH
X-Received: by 2002:a17:907:c15:b0:c2d:ca78:ea83 with SMTP id a640c23a62f3a-c2e23df5c63mr327337166b.38.1790840385430;
        Thu, 01 Oct 2026 00:39:45 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dc70adsm100397966b.68.2026.10.01.00.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:39:44 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,  qinjian@cqplus1.com,
  mturquette@baylibre.com,  sboyd@kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: sp7021: fix infrastructure clocks clobbering PLL
 provider entries
In-Reply-To: <179069997903.213266.2923932929883625249.b4-reply@b4> (Brian
	Masney's message of "Tue, 29 Sep 2026 12:39:39 -0400")
References: <20260820130224.1584902-1-ag@ffroot.co.za>
	<179069997903.213266.2923932929883625249.b4-reply@b4>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Thu, 01 Oct 2026 09:39:40 +0200
Message-ID: <sa6qzi9x41v.fsf@dev-ag>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Brian Masney <bmasney@redhat.com> writes:

> Hi Andrew,
>
> On 2026-08-20 15:02 +0200, Andrew Gaylard wrote:
>> The sp_clk_gates[] array previously included 9 infrastructure gate
>> clocks (CLK_SYSTEM, CLK_IOCTL, etc.) appended after the 64 DT-visible
>> gate clocks. The registration loop used the array index directly as the
>> hws[] index, so infrastructure clocks at positions 64-72 overwrote
>> hws[PLL_A] through hws[PLL_SYS].
[...]
>
> This patch does not apply against the tree.
>
> Brian

Hi Brian,

Thanks for looking at this path. I have a better fix now, but it needs
another series [0] to land first.

[0] https://lore.kernel.org/linux-arm-kernel/20260924164922.117236-1-ag@ffroot.co.za/

-- 
Andrew
