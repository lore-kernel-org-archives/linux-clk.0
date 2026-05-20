Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EC6367B75
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316167; cv=none; b=EFJIPUFb/6IqbuovRMOJxNRh8uIlhv5Ace6bg0KVDfUpsZo8n/ItGmBfcn73IGnhk5zabGdUoxfy/Rr8iatv1p/8T4bEq8CwDYoCEyRuBpMKNCLP4rHiivmQuaF/7DPqRD3HH5I89l45Q0MKvsXRnTIp09atbsBdOCbXOxS8MZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316167; c=relaxed/simple;
	bh=7MBZkYsBsy2oyFqW6yXMH44AbYezEh7Bmtf2l+C7Rmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj7uL6h0eBjRMcs5m08eKNkKJvfWJQX2cjGYhxy2qbn02ZgH/X7HTZtVCzCmFtaGreSIbDBwc3bZkIDg0uk3NXjHpUVUa8B/B79EOK83dOtKhN2gETrJ71R9OQheGmVavkiZLMX1Z2tY5ZR3kP2NbQkliRpmQ/AG+kuReH0EI6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=icoIbltz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QXz/E3fj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="icoIbltz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QXz/E3fj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779316165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnKR4/jVCPRHXvU9flP+lAeiZ2nPUtm5A71+jIeJCOc=;
	b=icoIbltzAYYM1KkwEPOoSdc4oTcD8qfd2eOz81h4qtWBI+5naB6OrJQVJ5LNtDc6Dlj7dp
	HPC0/sUPWNcQjPPAjSjSqxctmymAJH+7+92P9Kj2AKRtRMyFJZyIIc9oSUIg/4JA/UDAjJ
	o+wSWbaQif0yMkHWVShfxbx9PuDl1Gs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-INwDEk3DN7GVbMgKh4sTfw-1; Wed, 20 May 2026 18:29:23 -0400
X-MC-Unique: INwDEk3DN7GVbMgKh4sTfw-1
X-Mimecast-MFC-AGG-ID: INwDEk3DN7GVbMgKh4sTfw_1779316163
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b58065ea15so162385606d6.2
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 15:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779316163; x=1779920963; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnKR4/jVCPRHXvU9flP+lAeiZ2nPUtm5A71+jIeJCOc=;
        b=QXz/E3fjtz3mq5uxKDwkooeu1tcn2Ts3QxqTS7wV+L42pZCpjV3Yxa9UKYpgUuQqri
         B01NgvZvhSFWgaI2/GB82WXNQrzNSqhqCLO8FiTs/YKJTBLuoxjRTXC913+MjVNy5tm4
         fKG70MlpsT2Rj3UDKkC5Pa9a1ZjJaGL9QovOjcVcJ1kXatB0N+ZAfFSsDJXmzuiM7tgR
         NKbXzEQR4TRtcF3uAKKvvr4XsruN8F2egOY+Iwt+zGmybkaxAYP6gt21KEYRY1Csq7rd
         vuoyhfVP5bcXRTcLV08+fak+ioH5KuaKiZQObRvRGXWHK4o77c+azg4xWV7qQE0KfmEG
         /lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779316163; x=1779920963;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hnKR4/jVCPRHXvU9flP+lAeiZ2nPUtm5A71+jIeJCOc=;
        b=sC3LjMTsYIFvSu/UH08ODMVwSKVcxeW0InUygqcAeMRfmrhjOfsrRx2X9c0if5WNCH
         HuXR6uHdvFnhhIg5LjgKmlR9FP+y1p2gjT7XKdGkd63lQeFJgS86W3FclqSGNcS78CsL
         ea7kZ0HyXKPHnct/nRWL2zEEY4J7ed/3cxJFKPj8yM1yVioQOFCQ4TfpVCHKrQltVgIi
         KsZYU+V7AN9P/pH/EOPQcQMqm8+7xy4RBrd/0lNJQmxFdV01GrO5Knuzk3Y/YDE3rBjF
         1sTloXqHmfH9QQ/HHDPdSqMJTeTFCZpCdz8sNm7i8CyOsxOOL6ZmMNi/1cYOmPwPVFCv
         koVA==
X-Forwarded-Encrypted: i=1; AFNElJ8RU05ctQqzP1aaVwTXR+AbjGoS0il7LJWtQ54gUI0mHQzjUUTR2QYozBHUBjEmzMfRmNnN59/zVQA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7XHx4/+ujfseP03P5SUyLsEV7+LtwMfFRnR4QOsZhBQ83EtoQ
	n2X4SlpxELV2dPU75JiZNt2oSa1tcAAe//2QVlOOZRGJwJzG0ZbyEYBKxfau2p2MQVs2Re+klrX
	aseqeyfv44h85czzagxvy6Ilb6aL1Affgqpc/2DfmCWsVlFk+k1n8NcocXChs+A==
X-Gm-Gg: Acq92OGzF4AfYEEtfKE2ooAUi8TeiYi7pV3oqdulqVppOQrbN17wPdaE7z6+Vyj9RPM
	jiKpJHlwFzjsCtJ/plZX7d/FLzTj0gzYG7kFppsIsAO9JJfBqx/ryeHhkwMufmYGqRmczOjWZPS
	NoBsEzF1xLumeJ51fv7yQAqCTUdy2YcLcSUwuatPB+hS3YimbxKxuuDOgdX58UcpsDmCZ03tTFg
	3A8nXMJTzM0ZGhBVlE7arL0zbNnF3KtESKJi7jWRNleJ+yhs4wTeP6GVmCMFuGMUx5U2bnftQgh
	W2sYX8VM/I/h2kcGkT+fVI7ZloHRFYwqnsDOJatyd6oTsj/AHbLhS9eUrX/7Krr9LjTg6i7zlE/
	fLFAmayWubOTzeMIw
X-Received: by 2002:a05:622a:244c:b0:50f:ca25:fb45 with SMTP id d75a77b69052e-516c53e81b2mr6357221cf.8.1779316162937;
        Wed, 20 May 2026 15:29:22 -0700 (PDT)
X-Received: by 2002:a05:622a:244c:b0:50f:ca25:fb45 with SMTP id d75a77b69052e-516c53e81b2mr6356821cf.8.1779316162374;
        Wed, 20 May 2026 15:29:22 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456b6cf7sm204755301cf.8.2026.05.20.15.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:29:21 -0700 (PDT)
Date: Wed, 20 May 2026 18:29:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	"moderated list:ARM/MOXA ART SOC" <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: moxart: fix refcount leak
Message-ID: <ag41wJBhdK7-Zynb@redhat.com>
References: <20260520175552.537603-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520175552.537603-1-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Alexander,

On Wed, May 20, 2026 at 07:55:50PM +0200, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
> The values here are used only for error checking,
> but weren't cleaned up until now.
> 
> Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  drivers/clk/clk-moxart.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
> index 3786a0153ad1..7e191b1481bb 100644
> --- a/drivers/clk/clk-moxart.c
> +++ b/drivers/clk/clk-moxart.c
> @@ -39,6 +39,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
>  		pr_err("%pOF: of_clk_get failed\n", node);
>  		return;
>  	}
> +	clk_put(ref_clk);
>  
>  	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
>  	if (IS_ERR(hw)) {
> @@ -83,6 +84,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
>  		pr_err("%pOF: of_clk_get failed\n", node);
>  		return;
>  	}
> +	clk_put(pll_clk);

So this immediately drops the reference to the clk after of_clk_get() is
called. Can we just remove these two of_clk_get() calls since they don't
appear to be used?

Brian

