Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82E02D9EDC
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 00:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055821; cv=none; b=ZRRSfp/Xcr7KztQ22E0blTWznEcX4SP7RyVzXMI8QpNv4GVgqr/ll4VVTYHBfGA04WF6fCxNMtGgTT/2MKiYtjCfisRiSYYww76kx+6ixM1XuKfg/SHZHmu5ZfhXPsyJLoSxePFBm0AuYjMXfrXBlodJGAnh4Fb4z3mTcwalu/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055821; c=relaxed/simple;
	bh=NLGqiqnGiqlrrX/Jn96o+ScgglAgd2yYpoAiSl42MiY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SUNpqYkb+FOrCVlwXCVPlMrngm0wXgo5JQdxwgRny2pTsiUPbOvA4ZI90XxXjMkwvmhFAwfsUQ7IrLzyAOpTY1wauIBaBLn+15tOXAVe+dlNlU9LBc3dz4C5MQEqHHBDD3N60sudlUFylELORkZy4Fo/tRW6EpsGFP5axCDVuDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3AjcRlK3; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3AjcRlK3"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b144ec3aa8so1005592985a.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 16:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767055819; x=1767660619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GmB4IaDnBQbcN0DZ+rksSqBNuUUAz/TbWbwNTx7EuUk=;
        b=3AjcRlK3SolHiP6FwTVy0qkjdVawiSYdrM4SRmoxEH7ZIthziy9bs+8+Tleq3qEQQ7
         Nks7BSFNUNB/9TYe74rcCNbqNJ9zfflipkoOVcZenak3+FwF2h/ntezKVZzsolfZCDGt
         75CrAVu5ytJlNxQ2IDoLEd4QNsACwwndb/6jiCAIadPM4/iJBUzyj+PzNL9KnSFqn8cY
         1GC4ZTg5dQBh7me8rOwAVI8eO3Is8vp/GC0QtJR8nj/0kDzfvQOD6htnMe8BwBQ9I1X0
         snXuiAbvkkXnwy/8XXMLVCLQqQeTYoZ1j4eAAnaAPK8YuuNKcVVUmCxyBoBnOYRbK0S8
         s7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055819; x=1767660619;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmB4IaDnBQbcN0DZ+rksSqBNuUUAz/TbWbwNTx7EuUk=;
        b=Qe/rpfyw1AaKR3+MRChwedafsOzyv9dbEfjz5G/xQZWROUWsIiwM/44eAtjxYsXbXQ
         mblvDgy5ClYeS1Eg9rUzh06d7GSGtKjXkubXmLBc914p4GC+uXf26fQg7iolJbP0AXbV
         cpiBchBgX1579vfYd9AEFvZyi6zRNe82asywae+ySxtrF8UBjKvaLCvk08N/QnYbcc7N
         wnWsh0s9oimJdVBwVe+5CXXpBeG0CL7UToFf+4h4Z40R2X0yi8fUFVtLTr4YUMb8eMrv
         FR0/Q7glyzDm6KXFdPM2+gAAf3pqj/rWkQO2bysqUO6HXSYevUODsM3GmKdxBU+bGSwM
         GUOA==
X-Forwarded-Encrypted: i=1; AJvYcCUxgb9cCAwOLw8YYKfICnN4nWXridvETMGjcVTbaCFsMDTagoZJ1SXp6BPqOD4FAwj6yJg62ebRQ+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDCYMOxa8S+6mgNn0J0Ys/BAPQBJNsbU22Oon5n4UrtVr2s7R
	2FIe/Bf+F3hzkqYRmY9CtD8i2ZnUL9GLZLbCfM+UhYu7NvLqzgFQbyoWE7C7R7Ei+VA=
X-Gm-Gg: AY/fxX6D718aIO1+X0N5D4t/nzRJKpFDhNJ1ZACo1KfTofshTcHE4HUcRX52Q1qk2fV
	Drw3R1i42707o6HcnWOu3GlxidmFVN0M3HDkOiLQL7F1b5bQG5UtAMtd6JBfgoMdxpo5fgkTlAj
	VGtC25W9RBfYmf+T7HUOOqeprLFCaylfsnmv7yX0LOiO0lnNPCr2cLnqLxp5WKagfxNKHIf0cpB
	xLlouIUCuAlDxE/diDGynjy+vt+2HwKJaobofhmfrc5BnRqYh4aTXQD3xxjnbbmoiZZF+FIjScF
	C0jsikuzSIHzcWysAOrl18mXxmrg0L47DAIJOH3ynvhLJJ1WFAs1XCoEd9t8uLJv2g8hlwXyTAn
	ZLPL/dDh89WyJQ37kIXXTXbPj6aTt8nY4z3qSlrQZkuvGm48bwxtviJ87IUiZVJ0y0jQaGjvhVy
	U2vG1xvyYi1Xg/4yNVN4J6UOCv08PWvjaTby3QSQ7D1ag2AMuiouM=
X-Google-Smtp-Source: AGHT+IEqx11qIx1fExQIVt8RthOfBqirsnQypMP24TGrYewLCr/1F0cNPLqYX2PYXTzLqSFzTJNaAQ==
X-Received: by 2002:a05:620a:2950:b0:8b2:f269:f8a1 with SMTP id af79cd13be357-8c08fabf8f5mr5613056285a.71.1767055818602;
        Mon, 29 Dec 2025 16:50:18 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm2482817485a.15.2025.12.29.16.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:50:18 -0800 (PST)
Message-ID: <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
Date: Mon, 29 Dec 2025 18:50:17 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
Content-Language: en-US
In-Reply-To: <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 12:55 AM, Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module,
> the auxiliary device id need to be adjusted, otherwise reset driver
> will fail to probe.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   drivers/reset/reset-spacemit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> index e1272aff28f7..8922e14fa836 100644
> --- a/drivers/reset/reset-spacemit.c
> +++ b/drivers/reset/reset-spacemit.c
> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>   
>   #define K1_AUX_DEV_ID(_unit) \
>   	{ \
> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.name = "spacemit_ccu." _K_RST(_unit), \
>   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>   	}

The above macro is named K1_AUX_DEV_ID().  Why don't you
define K3_AUX_DEV_ID(), which could use "k3" in its name?

Anyway, if you go this route I suggest you drop "K1_" from the
name of this macro.

					-Alex

>   
> 

