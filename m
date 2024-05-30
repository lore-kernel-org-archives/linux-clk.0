Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE6176238
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077150; cv=none; b=lf5XlXjgPYlWFFkJt1ez5JH9b+72+mgzkViTA3LIwZqZoZ1EnenDBb3MaCiJDmN24gfKukw7QM+8BZVRyefFh8Ipe8KsX3XwMIbAlllNOtqvWUuUy7KkZqkhLHMjvMVYGderSh2/3v52ep0t9lSwO07yAcDtelEdg8EkBitNHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077150; c=relaxed/simple;
	bh=r7Nq+l30WnAPJMcoY9sAdA5J4veJVYeW/rCzNbYA8To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAZjCTYuZQGZAdcixHMFEkM4D3YiPaLzaKoZxBvnStkfveKuJlNiNF6HzmMtVAqFeXCUKkdtBxLpu4OA4/beYxmcNZUG7hJQwVnhqyjzg/XEBdXZyVD14kbHMik9QkRVxsSOSPQlh/aqxkBbCtG7HLPcI+6em2Hn9mzPVt/2EIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ur4nqItg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ur4nqItg"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-354e22bc14bso877633f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717077145; x=1717681945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5xCJKQ4ugEjWsoL7YroP9b14wp/Gl8VnioYQ/OGksw=;
        b=Ur4nqItgT5FN41pNzH3cNluCsLUW42sh+9pI6jIt2sIgGw9jk4mPVXBNIb1JWr8ZAi
         qXSP2VwlGiUDh5igso93zJbEG8kPccH23sjpCcU1cEk8vR1JIYqScax7FU9IxMgS2g5+
         D35KHeNHA0m+oZyQ0IVWagzlGPbP/8N7oyPg0vlqC4Qn3VKUpE3PlGMFDZ4gqqDk/QY+
         Gu6ydYQcGghV8AvRSrlEHfppfSioCxxF+M9Xw7lAb2DnGrBuiqjTbZIZeJzUQfSyESZ9
         Hoaxt2hw6JVeIdiP8yvzrv+7krvdt6HEHSzElAfJQzo5lvXz9Lqd+vucwFGFgT23otuH
         NHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077145; x=1717681945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5xCJKQ4ugEjWsoL7YroP9b14wp/Gl8VnioYQ/OGksw=;
        b=t7kvZHYPnFRVUfDvL81f5Uh710S8+4Jc1xSQlHX06IaEZ1MdgMi4LFWRhJ/qiZGjJb
         r1ZDZDUFb5Ket7H0m4VOHAT71LqapcCh12pWFkCBqvXYcJ6S75SdoEh4vFhXDhv9zWXy
         X5ZpOnFEfjXxdE1B608R7BnwvrSLGG+6mwvm5lQCZ9nbJURJnEt1D0Tvqrd5oqBPxbq2
         ob2Y/12VtxG5zsxGYN8zGGZUU9EP2kkRYoSaTS+hvDC6/wgMJEz0EtNzYFwnYFjFyGlY
         W6dlEKSa4ZF3qoEF05zaEJ/0jk3PLcLV+ISL45kiHMFpFevuJo0LAInOnEtbpRZscfwo
         R5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXmyMjwMYP0rDdXZut5yqF2rf9itTD/dfMWrJveTmZsc0mjzkwXQP+Eo3rUUhyTtoqiKEZB5hC2J0sE26U5jfLch799L+N90qgG
X-Gm-Message-State: AOJu0YypjBf+zn2UPd/hZGxZkGJqQOz1j+RkNKycF3JVHCLAucr5dD5t
	eH5s90mrNQNDjz2WpPP5uYbvBxbwMoRdIIiT2QtMaEqMs9+xZtXl+aUCyJo3BB0=
X-Google-Smtp-Source: AGHT+IFc1suDxNrUDOh2i/f0r05vdv6ugqX8mGy8cQBMw1VGOc/OpcHdjJLyHRt+fpRtRE8s9RTS+g==
X-Received: by 2002:adf:fed1:0:b0:354:f815:8b85 with SMTP id ffacd0b85a97d-35dc02bd8c2mr1521286f8f.67.1717077144893;
        Thu, 30 May 2024 06:52:24 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dbdb6f34fsm2471094f8f.73.2024.05.30.06.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:52:23 -0700 (PDT)
Message-ID: <27d42cbd-5985-4b05-80cc-59ab21b3435d@baylibre.com>
Date: Thu, 30 May 2024 15:52:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: Add a module description where missing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org
Cc: quic_jjohnson@quicinc.com, mturquette@baylibre.com,
 matthias.bgg@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>


On 28/05/2024 14:13, AngeloGioacchino Del Regno wrote:
> Add a MODULE_DESCRIPTION() on all drivers that miss it to avoid
> modpost warnings.

-- 
Regards,
Alexandre
