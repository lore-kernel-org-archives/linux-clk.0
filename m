Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ECA402BBA
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514438; cv=none; b=g8Dw2h8gAdJElrGOjjKrN/IDc5cy2ms1QTLjq3L39lAlF/gn1Me4cZyZ1psGaT0/Ehv56UhpBDXNE78NCF3Ohzq12IZ1yKMvQf9D52hqyxv0U7Yj0QyIK2EpLWDCsHFbaCGjdkLvsy7ttV7hui77HAnRPQFhV9mIiDl7d7sHPso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514438; c=relaxed/simple;
	bh=//cZI5dNMSNBnjI889RTNGrX0/AbonNKGzNdu70sR6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZVECdC9Rj8pGYOphPrVcqyWKym0547AbEFlHwj2oztyVha2VOE7NZlXelMJuXvm7SkLApHpLj5tLjSJWVXGDjnn21ZZ4kbU2UK/l1A5UtPTnS64/gRwlzSNz2lxalP6CRfnzkWh53SP9M7cdeYIZS+3ZfY3ayZMGPhi2IJ411I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VbCW3XVk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j2Wz3h8c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VbCW3XVk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j2Wz3h8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778514436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
	b=VbCW3XVk0Hh23LYfv3UNoWcwRt82IgTYRNJjsDfPEmVCW6nTmNyhi05GwwSWRJ6DixxuU4
	2jkBe6gGezylzHY9+XukOyg0N0/hY6sXznc4Z++/KxVxyf2fyOmBgmvPg/jspfMdLPVTzz
	XywwdgFtOLSzk6vvlDRlexLXXCSgsTg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-DnV2SJEsPXSGlVe9vsx2IA-1; Mon, 11 May 2026 11:47:14 -0400
X-MC-Unique: DnV2SJEsPXSGlVe9vsx2IA-1
X-Mimecast-MFC-AGG-ID: DnV2SJEsPXSGlVe9vsx2IA_1778514433
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d393057f4so6469393241.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778514433; x=1779119233; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
        b=j2Wz3h8c2HsznDyllmmn1ifxRi84n+aum3cskSj0qD6VcUg0ZGportzNX6VW6orauI
         JC/z9DeMtD/reKht9U0VP41zZ9/g3rQSdUzU+ToKFViz52XVaEZVb+62k8KujUGqccbW
         XdSe6KY/d4vHYZZJ3M3DqtwLRKgchMVJ+J57mCN6oksYvQW/HmuYGyzfEHE/N0Nh2sAB
         c7QiG/corQmayW+1Y+jroRACujU5uh0nH6zsbtxt7uGIctBNDb9wTWYm8ogvPouK3pm9
         8yV7aNt1Trxr4krUELR7GM8LlhiMhNDxPi+4GyV9ufuraZgI28FTucZAiJb36KRJUwRC
         56Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514433; x=1779119233;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
        b=rDc1TH+W14FA6xsFD87z59GQrG4/YMMmmLxZg3RV/10NM/okR+WZknxEzTPdJEwjKW
         2WykxSGLXYpJeuPEEWFqGV40u9VqPCRAUCDXdA+TcbYTbwhPHLFAZuZjORTiacmvoE7c
         a53voAHvw0wGAtqwEImvWWvbrfP+kBcwYs0ixW2HwKHAXv9JdVdFJVAGjnPYU/+GvfWE
         wATlgR8v04UIjRIGTRgg41pqYWo9ZubRcW3EhppmeYDSkkZGZLbDLulUT16hCr/yBkNi
         uU9yEebtxaSoK9erS3a7I5rqRPI0tXUVPf/0bItucJ16HzEBnQA25sP2HbyIqOxL2/Z5
         dblw==
X-Forwarded-Encrypted: i=1; AFNElJ/+CI9hHtcYxuNlyGXQdj1gGgQ9+0maZUpejfLByUihvbGxah6qf2dsWoRrzn9bWbUfPfQkyZhHV34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdAr1XMBzzRT2jq/mzBSBv1KW81zjgP+vDcxfk4MhI98a0ljId
	ZXFfbX+u6Pnd7mw1KPOsXp+4wYMNJ+IPh4VPh8GPvTSecP2oyugjz2e1RjAUBqkiqjf6MFl3vfO
	+nd/E9keCXdD85V6Ge7QCF49HzGj8BixQtDalonXaEBhN7HDeNPicNjhXRLzxbA==
X-Gm-Gg: Acq92OEh3xqvICxlOwvbZfldCYgHa9uYojNZbhy6niBYZJFVVgmry36JnMY3yc2hKuP
	bX2AUsi8YoR7v/Nmikaa6/V9Lws3DhOrJSWcQjUCnhernHD9kDlrr3UZGXpRxMDZltQgH2qohLH
	p5qijgvXY5Ce3TbeigyVjDWVZi7M6ADOuSwIaTl8y3mIlEuyhMNXxTPKR5OS9VPiaV2zqCU6Er8
	+uhgbZg2xzYIOz1O+wgeYB8G9Lo0L885vZ7a9tNxwVTd48X5k05tQ5g/vpbMTG4Jh6Af0Ewx6pn
	A9dxuqSjbLOqd2QIJD45eFFadS/bmwtKSvJAuzecHz1etXmvtLn3bVQMBIS8qommMczgnvLJWGk
	e3QVRR5XNHdtb+R0eiHWk/hOspdP9qemE92ApFpApmZhR9tcA9TNe90YnhSbQMaCqURM=
X-Received: by 2002:a67:e704:0:b0:610:db51:6f3d with SMTP id ada2fe7eead31-631da02a2ffmr4546439137.12.1778514433510;
        Mon, 11 May 2026 08:47:13 -0700 (PDT)
X-Received: by 2002:a67:e704:0:b0:610:db51:6f3d with SMTP id ada2fe7eead31-631da02a2ffmr4546395137.12.1778514433109;
        Mon, 11 May 2026 08:47:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c4c9dsm101224006d6.5.2026.05.11.08.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:47:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:47:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
Message-ID: <agH5_mWD0CRIcGyS@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, May 11, 2026 at 08:47:27PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> l_detect controls the enable/disable of the PLL lock-detect module.
> 
> For A9, the l_detect signal is active-high:
> 0 -> Disable lock-detect module;
> 1 -> Enable lock-detect module.
> 
> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
> like A9, where the signal is active-high.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

