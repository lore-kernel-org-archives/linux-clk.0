Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963193F926D
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398484; cv=none; b=njqaeJF+unRDeR6oP4cdJNeRXiZbEFtrMXz9oZdoKtYk+xyznoGk0nWVCdu4TFT6hwyTEtRZ9vr/IYkL4GRM0S3ALtXzoQXlr64rA+rk8xZLnm989uwIwIljs8qb9tsHA0yyOc8wDPP0n6ZvebsLqDxadKg7mqjur+OvggNvh48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398484; c=relaxed/simple;
	bh=LrsqqfM5Lf8SduY5JVzHWp4E8K081478dAwhdzwG6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRKDkPOYPeWWjwSOmgHJhBIX0X+j8dT4zFu63zdv7dSRks5MHun5cGs0RCsl46HoqnrMX3trPUI607TK1d36uejlFNPEuEPCfcTkBJjBilh6rDia/+8p6SQBm8CvAvlqbm57KHopCWYEQJh9rGNd+1Q/+46r87XJ6OzN0Daf+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/4bcMqP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P+PkeJtx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/4bcMqP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P+PkeJtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786398480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
	b=M/4bcMqPvE7OTFoPT7WmXs0MeNP6AZqxeJhNU9GB9sWGe1BgsHp6xoPuRzt8Q8W1TsTm2U
	XouBN8IXRdKCfsN9dGlOKsHT1mcEuj7ToTqO5MaVLWDLFIREp6wm5tvXUzAf9YFHaSMGJU
	ZjRh3eSRhXzzkZqgdvkE1sXO0gcuBds=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-3P_JiWv-PFmgXYKENo5t4Q-1; Mon, 10 Aug 2026 17:47:59 -0400
X-MC-Unique: 3P_JiWv-PFmgXYKENo5t4Q-1
X-Mimecast-MFC-AGG-ID: 3P_JiWv-PFmgXYKENo5t4Q_1786398478
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-820111eb28aso37345527b3.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786398478; x=1787003278; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
        b=P+PkeJtxjpzP6m8PgkxrSyuQwG0gYEuRUlt8q8MhvP9kcG1v3skAxjDuEgWA2dnbt+
         mRWqR0IYT+QNEk8bYYtdeA5vQNIShN//bfTHnVkubFn3XrZQBtv/4dbZzQZuab2kzGMS
         HegFx55QdRHxHw2MVhNO7U4fySi9u1PoCKqkC4rc65H18KZsjnd/Xa6SI8UfQFMVfUXa
         09qKJyNoYfjgK69OHp2c9quvfnQxfL00X8f8+0tB4dOVd+X2U3twVQpqMc/OQDVgEm3O
         iK1i5W38bKRfqKIWtcFJAT9/y+LwpTmdKKcM81ul56eTRxz3aDMrapZd7f1uN0Ia3H3O
         xZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786398478; x=1787003278;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
        b=W9uN8yKRDUeljTFO1kapb9akMkPVrR46QHlSGAkn6vF/iJ0NFU2F+rWld/4hKlwB1L
         bX2lxkCbIz24ERiCn5m16z17FwIq7pPoYIrCjqt25i4bUX4RB+5A0EcgA7JYt+oMcq/L
         WkStikg8+mzFxwdJdSzjGPRbj0TjZjadGbqCnNwgZdmVEyo8UecL0tofVR6j26kZoEko
         BpKUwi/g+L9c2Cxo+2Cy5tL0hLRAUI1NTw5i1Aa6Oi20qBD9658odb9bJakA4WUaUyWs
         23hwVupkM+wRemhBKORHkpDQVvhYVfGhu/UtcZ2Jd44DUzkcNIBW4M1qkBsEkAqRT3j0
         XMBA==
X-Forwarded-Encrypted: i=1; AHgh+RqAA5+vDS9jM3x+VKyfKZPuG45arZyit2gYTGESJSzMiSrORI6cOGvW6kmN2+vsvBkCzeVxhfPp+Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7dA7H7cQPvTemiloB7vMcvb7k070bvBMqpDs8Aov9sWhZE8k
	Q4eWbilTsfMgNjo9Hfm7YsdZsefPKr8abRGIxuEAjtkQhBjwiL7NHWxpLpjH6gwR81eQG3O61lj
	aSChRxYdghcl8GSIxReMfbk2IubT+UvIjF3Hyu4qmMELkHrgrpI7NLnBrcD9Kog==
X-Gm-Gg: AR+sD10M9BnzjaqRF4cpQHhtfXpVu0vHfeUdu1Sse6UDeNxlj3rI3Z8znS7l0AcJWd9
	hTJUda73vJBu//GTXkrfznsgFeGlBsszOSamlBInXAUHGLKWM5hoBNt16S+UA9TTVMZKK2/Cbz5
	H1Dde8c8Hf3ggGHH5OAVqwA+j1ArbLgLNHIMylWE7iJa6ZwpFv1GMjgLDRVjGwovSJqodTXmyf5
	vR7G/GwgexqKHww/RhGsIAaEA3Zh2Ul8JSaIrvZ+HqP+G2REIpxDg9POcsugqNudt0vUbi+kwMk
	D24zG+o56kGPr7msk4HhBkWYxNANC/NY73DC2v/lvRLDZwFT9MtxrjKsQmt9GdAM5+6TPoysyv4
	PZI86933AX3SYoSGhoXGxh4LfRWmpIJBmnVw=
X-Received: by 2002:a05:690c:9989:b0:81e:4e5d:484a with SMTP id 00721157ae682-8243fdf211amr161873487b3.2.1786398478510;
        Mon, 10 Aug 2026 14:47:58 -0700 (PDT)
X-Received: by 2002:a05:690c:9989:b0:81e:4e5d:484a with SMTP id 00721157ae682-8243fdf211amr161873217b3.2.1786398478040;
        Mon, 10 Aug 2026 14:47:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f577c580sm64586967b3.27.2026.08.10.14.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:47:57 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:47:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anpHCvLCm1JKImC_@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-5-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-5-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 10, 2026 at 12:28:24AM +0300, Stefan Dösinger wrote:
> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

