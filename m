Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A37D258CE1
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532034; cv=none; b=is4pq6DQF84sz5ZEsEV9/ftdXyqkaYs4mX57ASunGIqrA35WTfs7lxh6GKuFH55TUJDc+CbsLkSN/cz+CNAwbIuSLDDSGdnEB20HVSmQ1zUNB/D8q1Zf8JCwU4665M3KkXoxu7n3pBrMgSPC9I+SX16pgJizFyvaVH2zd9r0o74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532034; c=relaxed/simple;
	bh=WUakmhPTGh3JHJBduDtg9bHzUVeNreikaFApL4jcRsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6bbGRYx7gZAjkx5bHcNf4esImSSVsBhrS6jUvYOVDXD3HfkUQv0F+cYByMLvvZuwAK/EzfqtLMe0yxhekFVVj4z0lGkqEm79tZhJRSxhiIpZ1A1k2wsFtxwexI77pGvrOtOKDiCk0wX6P8GGE7nZL2BqbmksLMtT6cW/ZS/6RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=I8Bq11ah; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I8Bq11ah"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b109c482c8so75693691cf.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755532031; x=1756136831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NZWNuw9uqGyH6UBABpbY9lwXWb90jB/i2Dis4FmyQU=;
        b=I8Bq11ahQhqfEnYtsoH7G5MNTr0RniVsDDpcFBN6FbPC3qcn8JVyOaS2C80/YmoXJh
         g1u7ie7+sP+0lS4MEzyJlP0oS/jhWoi4vLDhkDlpm3cbKKseDCEXtCQDKGRTQt7xWdvw
         7X0t7HkzqpmmCSBgY3ln+Ga3V6AK2TGdZRDON8MLGffvM09MWJJXCNwjsx4KsWVwpiiZ
         bfVTXIGI2zXtnmz+g9mcKnasm2r5EK5PIazfJV3WQ1+gD+5GVIjlq9MJYcGVnCXV/d4P
         lMnYu4tcRpgBZVJN8xep2x6VD7Uzacse/hc+5FPjaAA7BCUOmJLerQ5Z4JCQiBkx6g1I
         Ub+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755532031; x=1756136831;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NZWNuw9uqGyH6UBABpbY9lwXWb90jB/i2Dis4FmyQU=;
        b=iW3Xc6c/nRw73bO/W51GuMhE+qZKYvpSLeU6L2azTvDeKKJwVDt5dY5czj18ANyH/z
         863pnhVG8nmuJsJ8NTwjNeSk6WIxpnMQR2rneXJIohv0TiCBoodaFpSSH40dus9EflHz
         7+HncwusHx2uU14656HoSvkyH3u1updlsMcO/PotKLmAUdFw+3vVEd7BAwaaBbtPRHK2
         HM5dx8H/pUCOxsl+LwroSNsjVhPTFARG/Yu+XJhx5uu7UR9hKL33t7/o9SwF6Sa72fC7
         a4JnUoteiyzniM3cu/Nf3KgOnPMhbkYeDVK8q+RYu+nLv1CMOK/lt1kwafB6U8pKXos9
         j5IQ==
X-Gm-Message-State: AOJu0YzJ5jhW6eIBiIZ9ZCU+6lw+tprZf4sUttWa2e++jd8CKexjxkJc
	MLdqRQcTKyIkflH3KXTTQpe78/lVQc9v3LAzafOYp1jcRmxUK+8LqRoMgKD7rkg2pPuG/be4qEF
	kJWJd
X-Gm-Gg: ASbGncvAtZfgCOpXaXz98Meu21IoRDBiAxFHY26+Eys8DlxFmviGQTe+ZQYBXF6khO0
	vAfv8UzumF2hLELmFk0+VLx51bpEifsFg6lLBYPgOdwVni6nWRV+SfRBY6KBpjIgmSOEJVD/S9H
	qOqffEZ0sXcgrevzZ19QzxDQp2RWAYEjbLqDtHA/mi1gCfil1baBFhI0Dz+qBbH6OyTQFkQ+fQv
	qmJp7cU1YHp+vuZZJS/4cFy4+X/oL573jRocSRQ7HlulpSb33LJaSV50l46qN6ZG1WSu+qI0hrB
	e82T/8F8yTDlILrCtoVvrQLoLrqCriqyu4xyW9R29HTUxZ42Cl7AieVqZp6p+cbu1WIqyw4Q8N7
	LWNcJzo8n4ArRJ4UNgrEQC5xi4PBMqLjZ07rN9HES
X-Google-Smtp-Source: AGHT+IHtyZSzLjJeK5dygj5R68bwBBP999TKqLNyPthvXLv8L+n5/XjRwQcWRiuFAFjpEWW5iC0zvg==
X-Received: by 2002:ac8:58c4:0:b0:4af:1837:778e with SMTP id d75a77b69052e-4b12a74e438mr104897681cf.31.1755532031187;
        Mon, 18 Aug 2025 08:47:11 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.10.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1e15besm610112485a.72.2025.08.18.08.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:47:10 -0700 (PDT)
Message-ID: <7502cad3-ca4c-490e-9b11-50e3297b6e32@sifive.com>
Date: Mon, 18 Aug 2025 10:47:09 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 046/114] clk: sifive: sifive-prci: convert from
 round_rate() to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-46-b3bf97b038dc@redhat.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-46-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-08-11 10:18 AM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that the changes to the three header files were done by hand.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/sifive/fu540-prci.h  |  2 +-
>  drivers/clk/sifive/fu740-prci.h  |  2 +-
>  drivers/clk/sifive/sifive-prci.c | 11 ++++++-----
>  drivers/clk/sifive/sifive-prci.h |  4 ++--
>  4 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

