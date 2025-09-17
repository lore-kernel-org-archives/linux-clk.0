Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2635E1CDFD5
	for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119570; cv=none; b=azfIC1lkKJ0lfgAq9v6BsAbqRywcqMMx956SSnI/jFFYUfha1K15doegRPZ6YZWQbqSleg1ZcnXGu4q/t4PhhODi6PL5S/eqvr9SZR9EgZ0rsu/HB/zuPEm2vQyoclXYWjYdXGzZMF2xlBqmHf+gN7euNibKfXSWbDq7QrSl09I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119570; c=relaxed/simple;
	bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyqnLqlDwzkbdggfIXS9Ioyg/FBG0LWKnqo9Ivbv/XKutkwGWa44J79aPC7TdxBlv7YuXMf65p9pVSX5qrnzd0WoowyFKId7U6BTJRjqzeA/+s+7F4Vw9TkthoMb5Ggh0uj2T1R8Qj2zmgbrWBJw+UBkKsbiOmyLvf82jnLZr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUYV48in; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUYV48in"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-ea5cbca279aso301140276.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119567; x=1758724367; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=;
        b=OUYV48inhaKrKUvjYB7tdrAfAuewYRj+RLVJWMrAY7IAFAzABVufqZV5YelVdS4xr0
         9Yhewg5BsXreT2vaPw31Pq5/GGt54tgd/QBGH+3es0fxAjhfutft7w4IIYAb74YR8Bkh
         5NWViOjWBYqSXx5mn50IfB2dQSFXU+/pfVNKQSDDBNcuv7gzCRXBVE4yd5c9HbC7P5as
         f1q5JC7+3/w9VGQo4FhAAICJrjVc02MmdBgY3GPXYN96Z+EP6I5bfpC+KXnNRLnMlTj0
         2GdAyayUYLqVV48RKZ2YtaKu5uM2+w6ap2WxzEpFdKlsAeb8fXmd4yjkaRoYMrFFWPym
         eAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119567; x=1758724367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=;
        b=fIzkAZPCpbVdw4R50sjgN0eEuITS9nt9cfoD9C9qLzAU22aIOSgKuSKuuCUQQ74R8f
         J8CXyz1cleCmoF+eMROWORfW1J3GDQjYbQNpFqvLfoHr5QmM5Z+YAgBn5P1066KvWC8t
         NEIqk/nQV//5Zfd3jUwvayG+LcMD0c/FqE8JvvVw16cbAJWTXHGP/RDWolDfQ3aS2d8G
         /6+2RhiaEPyVvp7400fDt58nzE2+l6cdbtmdpIYIwWSMY7da4f5OKDf8QEwZ1fvTrJVr
         YZIsdIKFYLFWD/wGX22GbDjsa8fwT28p9eZirGQdl9vIx7d0JWIc+RqutVc135rNIGMd
         EQTw==
X-Forwarded-Encrypted: i=1; AJvYcCVSWE+yD8IpHcGZYfDL/eOs3MKupfrWCnVOBM1YFpckihG7EnSRYQf22apH727XyevvjJlXutKFTW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYBdmSSrqG7T6OYqzSATxlTz8A/Hpc+95M5BXkAdEA65StCBzC
	ixem6rWL2FfBYrp+2EYvZ5pNK7tafl3fnuC9sGt4zHp0asEAQSsIayykBBr2VuK7Irc3bqF8v8k
	iNe/LiaP5KwBA/cK8CS/PkJFRcBAp8A8xMBVK11jahg==
X-Gm-Gg: ASbGncuLH8lOp5DFeZWhEWug1GgdSOIhQ1SpktZHT8IJ0kGGn5GXQ1CeOJlHJzC6wIU
	C8yxx/+RFfffVo3CRoufBAFuSV9I+okDX0XAZhGpZrfVDhykmTUQ/Jg7LKNcUKoO14FKcX6Vvrg
	1KIn6+OKrgeMuusPXEDjvoDK1zfQWcvHcC0jfLfLSe0WsqtNZbf5mjO2pfbGmtSp0x9ndE2D8NO
	35uiZdM
X-Google-Smtp-Source: AGHT+IF8958qtxMgepRmmh01erhzEe2CCKMaB8p0aTdmbEk0KITYYPXFKjQVfYFyDlneSgtW8sFxeX7TRTnXN5JBV/c=
X-Received: by 2002:a05:6902:6c1b:b0:ea3:d667:affd with SMTP id
 3f1490d57ef6-ea5c06c1586mr1899822276.53.1758119566841; Wed, 17 Sep 2025
 07:32:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com> <aMasUV14w0Dc1ki0@redhat.com>
In-Reply-To: <aMasUV14w0Dc1ki0@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Sep 2025 16:32:11 +0200
X-Gm-Features: AS18NWC-l2ZajfsWo9MjcYD2GJjmouYf3pDYfF1nnijLrVzTzi40JFoPMgBPLz8
Message-ID: <CAPDyKFosHY_aVP3EdzXJj4=DvZCPfC5c80oSwTEeyyV-7MRQJA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: airoha: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Sept 2025 at 13:51, Brian Masney <bmasney@redhat.com> wrote:
>
> Hi Ulf,
>
> On Sun, Aug 10, 2025 at 06:16:19PM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > appended to the "under-the-cut" portion of the patch.
> >
> > Note that prior to running the Coccinelle,
> > airoha_cpu_pmdomain_clk_round() was renamed to
> > airoha_cpu_pmdomain_clk_round_rate().
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
>
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.

Sorry for the delay, applied for next, thanks!

Kind regards
Uffe
