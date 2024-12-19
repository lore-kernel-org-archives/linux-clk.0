Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B92253FE;
	Thu, 19 Dec 2024 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611454; cv=none; b=VfYVycx5jgo7PPQGypwhrIfwJdrciGo6gddR3S7xL0Uc/Ny3GcrN72fvlzakE6aKYlRjuQGLgnXoTaHJx9NWUs68Ou2EEjPcvnFFg6BIu8+2CGuIJnfZdJP46Cx/X05N+AFArnXLNFFHVsd1Nue4kTp83mKFDJ671R9TKAetOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611454; c=relaxed/simple;
	bh=NxBnfk9qfZvRjzLyS5TO/nI++Jp99D958SXqmfzZgyc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/tEcce/gU1Z4HiwXVe8kcCxqG4/xkkHUSgHTylCeji8rXR5LuBKVLPh4Qduug0x6QMS/rCRexGnYBCdh9YEbWXDCL0IuklbNNleMpK2sYQYoh60S0mOeDYFp0Nbm1IBjIKeelgxi22m1mDS9RtGbDeu9pvlideF4fS3M4shnjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCP8kL3t; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCP8kL3t"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436341f575fso7701365e9.1;
        Thu, 19 Dec 2024 04:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734611451; x=1735216251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1g6LR4H0uqz9RJU2diA1TuooLF3ku5hcyt+RvjYjh34=;
        b=WCP8kL3tiyyTBYrOuj1vbB5jS+vJ/h3KAVEp9o6GmyfKqXe7rLjKBmxePq02McFdZq
         Ima5LJIhA08mzKlxVw91ZtieIZTEJmRzBVKqe6XqpLTkwWZR1K62vkzR7QdJbruQ4eZ3
         NFlDExSYDPO0uq/xfqRv+un/UjSXQZ/PntEXRyHJs9Axk5amkleact7emFgqyZfj3CKD
         GLpIjrpp0a4o4f/uISDZuBbT5WHQlwLHjB1+eZTIcbFzZPPJyijQh8XJzqxV8Dtlghx8
         r/ajwi1tyOQJSq1ZSJWV9DPbmYp3dJSUITQvvrR76NIm5WxgTWAumdCVwYkdn4HVipBd
         gRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611451; x=1735216251;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g6LR4H0uqz9RJU2diA1TuooLF3ku5hcyt+RvjYjh34=;
        b=TH04MU98HPAwUXpe/M+pAjvCMVrPUiEFFtLliJ/hygLqB8dW1Zvp62p/AZZrdC0Q6f
         8tIErD4sP3GN35z+IaoMLpXtNyzC57ophH55GAJUFXqkqUSsK73YqVf/jxIGLVoZxSj1
         0WPEIIUCUQjeMdZqnEuoTsSyZRmO14bZCS2x97DiXcWr5ZtJiEh++gDSGsBGvXtlyzOn
         xwnvcPou+pSYOEK6T6e13RJW18fdIaowRT8tBPRQTT9iwbNnG6Rec+QtqTSVfwCsVtFc
         ZFhLB9V31H2V8NJ39JU43dgqJ9LdFMFEyE7Bce4pqHtCEKq0exjUenpm92aPlzO1P+Vr
         FumA==
X-Forwarded-Encrypted: i=1; AJvYcCVqaV3g3GAu/YjIXACFOPKW6Q08ciYFN2G7DHLVwNEiUHENFuotT1cNtTBWyMXRtQvh9GVuhJoCatBm@vger.kernel.org, AJvYcCW1uHjupwTOxFqBc3LiAnS4o/oy4wOaT/qB57K0CIrgqbHzs4VE+qLBbPCvZpAv9SIS36RRX941u6IL@vger.kernel.org, AJvYcCWHyuTmrrCCI2Tf7XMzMcCgaP7JVYeazRgL/YszW8Jzqy/tuCw092iWPHuGkNStK+VinOjqy0AjPET8ruZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8B4+XgeHzLsADKyzqS9a8M3uK2jCdYhPSZVc/IsuOhJaXHcRI
	fVdewwracBYylxXIC4Ka3v9pe33JjI24QeXDrRunUFH9XDYhfP83
X-Gm-Gg: ASbGncsO6wp6EeabUmTxnw2L42Id3J6tE9uGERco4tFTfJNnW+CqrjIqobOS2ru1LF6
	Gz+Dl64ioWpwTS6FDeG5slnCyKSpChR9iiJCCRSRYxdvcRSyibxWgdkTUrmFwUlmjH1eIyvjyes
	8cL8tF8a2FbArdNwXkqkQ6Pmr6sK5BY+PxXRCx+auYInxOawLdXBTH+J2KMOXhRGPeSshNuOEle
	n6cGMjojAKzHlZm4nvo+uquYy1hut/9xqVzIzKrLE149jMM+W2qbmEshcJFtMrGkNjhVD90Q419
	3mGI4Gwx4KccuYfoN9VT4UZjVlfTdw==
X-Google-Smtp-Source: AGHT+IH4dfGSkyzPdj2CjqnsPdAaGQdc9+XlzMv+SJ3G7irF2/hJiSyypr2kfvgSu/h3wPOvreJftg==
X-Received: by 2002:a05:600c:3b88:b0:434:f586:7520 with SMTP id 5b1f17b1804b1-4365c77dd07mr29004795e9.6.1734611451254;
        Thu, 19 Dec 2024 04:30:51 -0800 (PST)
Received: from Ansuel-XPS. (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b271sm50462095e9.34.2024.12.19.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:30:50 -0800 (PST)
Message-ID: <676411fa.050a0220.1868.3d3d@mx.google.com>
X-Google-Original-Message-ID: <Z2QR-xrl1NqvfUmS@Ansuel-XPS.>
Date: Thu, 19 Dec 2024 13:30:51 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: drop NUM_CLOCKS define for
 EN7581
References: <20241219121902.16339-1-ansuelsmth@gmail.com>
 <20241219121902.16339-2-ansuelsmth@gmail.com>
 <af251ba3-660b-4281-84aa-a715eb83039b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af251ba3-660b-4281-84aa-a715eb83039b@kernel.org>

On Thu, Dec 19, 2024 at 01:28:59PM +0100, Krzysztof Kozlowski wrote:
> On 19/12/2024 13:18, Christian Marangi wrote:
> > Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
> > should not be placed here. Value is derived internally in the user
> > driver.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v3:
> > - Add this patch
> > 
> >  include/dt-bindings/clock/en7523-clk.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
> > index c4f8a161b981..edfa64045f52 100644
> > --- a/include/dt-bindings/clock/en7523-clk.h
> > +++ b/include/dt-bindings/clock/en7523-clk.h
> > @@ -14,6 +14,4 @@
> >  
> >  #define EN7581_CLK_EMMC		8
> >  
> > -#define EN7523_NUM_CLOCKS	8
> Are you sure your patchset bisects?
>

Well bisectability is a problem. Either this can't be dropped or the
change must be shipped with the driver change.

> Also better to arrange cleanups before new clocks added, so lack of
> conflict between number of clocks and new clock ID is obvious.
> 

ok

-- 
	Ansuel
