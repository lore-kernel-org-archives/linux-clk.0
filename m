Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88F4F4D12
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694989; cv=none; b=ta8KRYPtGntMkXX/yZmJisII99sFNNqYiwqaFaG+wEvqSPcr/VVNaZWBwITsRxQ8LpjoiGhhgc/z5bsfnlQAIw0PNjSZqZOWXIrFmc+eQ+0F0hV7KVNLwYzSkiLK9HV5v+2jrXd32m9r/pjFL/DsvuR1wXF3z0zwE2+6E/2LsTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694989; c=relaxed/simple;
	bh=bWF2RLkDSukvRv3ojzJFf0HCx2pYwdCFf9sW3v74D0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BEPIkp/FZPR3s8vU/ff//YdDKkwzNB0rvNOUmjJ2VGLk1xsqi0ruHI2qwAC0n1gtW8J8jktBbmYV5uuAxrhLdZIyCgVeG9mwLKZB+3Hwyj/jEFJP8Y6mZnxeEYa4gAviLL0UHzqVMLHd5fSqSUKEsyShpC3z2Uihr7qxa5frZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cIrMafCS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t1IVhKGo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cIrMafCS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t1IVhKGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790694974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=haHxVk6HtMmMg8MDyLTddniohI+cOYlGgDr4EoKwINs=;
	b=cIrMafCSJo6emC9ddqz7lq28g9jQ7un6WjTaCxazzmF9SeElpXSNHKhVl9rhomV3nK07B0
	B90QWMpVjGA500lC88J+XZ17U15YL4Iy04CNmJsLoCOaNW8hJFYpN/wrpESk0eOWyT7Cx5
	ffHBYovfzBdcqL/UrrPwtedxkLxLWBM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-cvqcLKWdMzqo1CeafgYNiQ-1; Tue, 29 Sep 2026 11:16:13 -0400
X-MC-Unique: cvqcLKWdMzqo1CeafgYNiQ-1
X-Mimecast-MFC-AGG-ID: cvqcLKWdMzqo1CeafgYNiQ_1790694973
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5e9c2ec1so185855085a.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 08:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790694973; x=1791299773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haHxVk6HtMmMg8MDyLTddniohI+cOYlGgDr4EoKwINs=;
        b=t1IVhKGoFPqf09lPU8gqwRcCxXQZBkx5NC4TR2+/E1fefLE6YJdqOJUiNfuJ5y3kbz
         Oeord3cjw9cKE5b2WWYeMCeOVtTYPH8GVNL++CgtdO97JdiKx3JZPuq18/NENjwNGt71
         5qEryrEZfBsN3/JTNwkl+JcedGdzoarYM365yRo9ElZqPLvoy0M1epz6QuEdnbc3hRYH
         24JNJ5fWSENmLnDx2ymFdmfCMWK5d+ylANvYMG7QshVuW9+V/7G3wa3StDfTh2BrvwZy
         8AUWwnvx28RQqMxwvDgoW5JezfQTyONhu3BhpJPEiFHSr+lHT+J+aNZF2mL7i56TlguX
         pXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694973; x=1791299773;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haHxVk6HtMmMg8MDyLTddniohI+cOYlGgDr4EoKwINs=;
        b=K+lI69i1sFNjd8mgQlAIOM7nZt1ZS+ax53OX66IlJX6fVeKVylUb8OnQr8sibGWD3U
         xVhIPPfB4gKfk0X//Dtsa/I2JT92eNoAaHOUNAcr9wl5+wxDJF8Eo99rV0IOoCHuX9vA
         5Up5sdktCASiPlrQIcTFSYIsyhXtQ8tD5eM0XZWp+C9Qv/Nm7lycKCOW2/eUI1sDZyYB
         5UNi9eGWinlG+txc8wrfHEYeXxr+X87shQDE20Og8d9tgQ2rCodobKYREZS+7ML2X4iV
         x7QI7vZTpeRArJTR9eJUTaia89TVDyJjvrbx/iRl1as+luQduRyTT/mIrgPnZPlEmLEt
         xW7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBoS+70MGPBBcdoHNr7RO7TO4xE1F1gQl4Wny3cEHA+U4cAh97JDYNl89txWFI3+Yhe2KuH3Nul1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kYe1+xMaxIvzx9nfm/MAjfmBiVrGQFoH/IGBB5B9FlpnXLKv9Q
	DV2pyvxvbffsABJuQ4GCt7w1sLRnlLZm10H9SoUuf/e2S3mbvMrNIyIDixoRUB9gHZ+ysphgLKB
	9j8Lh9R24Xs4e+eWDYudQV7Vb+LxUI3AqopbbImMhG8obBbPoibc3xOxrbqIf8ndJLTFLTg==
X-Gm-Gg: AYBFou1fQ/iVjQ2glXo1Wvn+ZL5mPni1610VrOJ2QWDNPob9B7J2clXpLASQanFOaXM
	rz4h4bWOT3OCzdFTm15oNvD8+n69fC5nHa+unUSyF9Xua5xjxvunEtUn+ZbR+u8XhhPjGR3+WX7
	/pa7rCo+0kEx6JIPFS9p3+90UZEuWgaD8vriuTGnwlujdDJdd5EGPjmK/UnpgUKF2zNPEmsHqs9
	o9OZ5lIaGlF+7/afyvkS4+wP71zghAtXzXMb42dllS9musSpyyPLKG639b8rrBv+ftj5ijXSgXz
	eODYywCeKWpSw2v99nhT9y3znEsFU/8KHc3eut8nsXuTxy9vt42eJwbtxakgklhuJqrxE9r2UTI
	PBgYrUZwXIEmFpXpdyxo3vxk+zwTAl/Mhd2TansB316fbulO6t2M=
X-Received: by 2002:a05:620a:4722:b0:93c:5b32:c9d9 with SMTP id af79cd13be357-93c8bcd086dmr532935785a.6.1790694972668;
        Tue, 29 Sep 2026 08:16:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:93c:5b32:c9d9 with SMTP id af79cd13be357-93c8bcd086dmr532929185a.6.1790694972197;
        Tue, 29 Sep 2026 08:16:12 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c81598783sm411763785a.46.2026.09.29.08.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:16:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yury Norov <ynorov@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>
In-Reply-To: <20260925193858.250215-1-ynorov@nvidia.com>
References: <20260925193858.250215-1-ynorov@nvidia.com>
Subject: Re: [PATCH] clk: si521xx: simplify si521xx_diff_idx_to_reg_bit()
Message-Id: <179069493301.199845.17240762807739332840.b4-ty@b4>
Date: Tue, 29 Sep 2026 11:15:33 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=306; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=mZR9PHzdXdFqvDzHRwBoXIJQhHINnxzMIo6bw+8Twnw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2XzNaqmWlqvTFQsrRXjf7rzivh0z3RbaqotPnHUVn/
 54d33S3o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgImE7GJk6P4llzBrV8++Nzc1
 Q5k0mQslWCQc1/oX/vjZIPX5+4mrRxn+Fx0wan78vuHLkZuzClREWF+kdy7SvCsaE8S8QHKHbts
 kbgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 25 Sep 2026 15:38:58 -0400, Yury Norov wrote:
> clk: si521xx: simplify si521xx_diff_idx_to_reg_bit()

Applied, thanks!

[1/1] clk: si521xx: simplify si521xx_diff_idx_to_reg_bit()
      commit: f619355a6bc6e2ce8b2b104abfd4f2c86e22aad3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

