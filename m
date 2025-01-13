Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885E146A66;
	Mon, 13 Jan 2025 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804282; cv=none; b=BwJwOda69OSJvUpVuUcLKaBMVNhr3pUCctC6U8Aq/CRh+EjQ/uyMoL27NmDaCZRNPAIwj/9i/eKvnR4Ym715t3oQt1vxU/mxaJSpNsTXvf65Xe0NdWb8wmpSnLd2rtqGabVqTiaoogZM5L6sNoaZE0vqeGnyrrWeQcpZyD8Q7uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804282; c=relaxed/simple;
	bh=TL3dgHo15L+Av+lMP/IMBMM2NUM8OSveBZEp0Vf4b6o=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYVojH/6+hAjEwcT6IJvDiXfLY454lkY1p/Rb6g+urqzZjnIAz2IBp59+W6j7TPpA8OVggI6vL7DSyW9GK5tzBFuhkbb3VPGwJkq1d7m7RM2kxgxE658Nno0uPNeJS6yOfC8TSwZwY/kDmQgdGsBAbMnWqQ3gKLkrYJuV9A+MrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rqu4QIw0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rqu4QIw0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4362f61757fso45831985e9.2;
        Mon, 13 Jan 2025 13:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736804279; x=1737409079; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=btAHjp/MHlc7ntbhptRjA5RM1/6iiaQV5XzrNvH2vpc=;
        b=Rqu4QIw0JYdGsS7OvWmjEL/Q4iz6CTwA/Bfh2Si/ZEZABkcQZlpw4UxOBLw1FoHGuc
         7CQ+3h86FwqUOikBsLSHiFNXVtQKhIum8RCoa99fHis6jcGMc2GFoOt05cqx59uAV0Ow
         xD7Z7Zll6GvRKffSb0YU3GZ7bmkEQQUaZKFlxIpElnbVbHZjgnC7Tdv1Gw1oiMxgxIk9
         gsCeRkyzyEK9gk1oii6HaTz4GwWE6Revr+xq6qsvDR1qgeGRgG8EW4zaKGavTH+AkwoY
         K0r1zV376isGlq+WWIw7VM0XYe6jNepxikT/+gHAB1oDZQ9+Ne7SdTR9wdPnxQeC+ppn
         RMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736804279; x=1737409079;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btAHjp/MHlc7ntbhptRjA5RM1/6iiaQV5XzrNvH2vpc=;
        b=AMgL/zhe/iJLUKVdkYoj+tgziQBddFlglPBcHKjUIRx6DbNlRb62SOi4lKB3zGYGhS
         dSCDhU+PWuKjdVtKH13Z7+x0yd5DLMygK3V00LgVFTrQySbLxtXdVAppuNxJg1cWXKh/
         U+N8p6OZTP/glHd87Urb0+23meQhEDog2mlcgswLB1MgFdHzhy8sHkAzYVRqZeLSY9h5
         YJucUnDbPWbGOCQCzDCFtjPqASQNX9SfGTQW8JTGR+YzcgdEYEMjUzaLBoT1BHdyzus1
         hAEGBsIl54aQQlmt3vEvA7vO5m1cKZDlVEWgAI2sdfpAqT3a16fOoavwFujB0e342V7G
         qM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8D82kKOrkoNGzEicq7TBpPAsPhzJVKdFd/1BaHZhRrrfD/Nua3JwKuLM+Qrwjzo77SSoCAxAgKM8JZPCV@vger.kernel.org, AJvYcCWUWnlES7iRHyxZ89nkqc0PBPy4GrEsbRZWt0j7tyl9C169wAe089d4wxOdkh/3NZS+PwHdojvSB8xg@vger.kernel.org, AJvYcCXk9S91Zp0U9QCLFolCtvValAy7FAzAoQGtEkBjh5UoqHUESYHtVtzJZ5nB7jRCQ8GEX0ZlLpkRvy1G@vger.kernel.org
X-Gm-Message-State: AOJu0YzSVD3nnlAueycvNt3BSbTVVsAsvy4VYoiir+hCkcqC/HHcuhV+
	ty7LfUW6CyGFQMfd4RvkjgNBXQcYsbKq32bycEYpPiqZMeO8XNpyWNThqQ==
X-Gm-Gg: ASbGncuE8S+QbyQmI4gFchcKfhcJC2hN/Ra1d3N8YbeMGPKy0ocUVA/EI/kIEPwx3pA
	pvLUT7qKy+rVRDwStb8Qg7jxuFtVtjDvEQOP9NM2ZMHgz/8m4GwqFDP+N6D5qSHpOwsm3Q7UmPS
	7a0XBypx7dbOR1IbpZrz/q95GYYF4bvYPoVzj+D3RqiutwCn2F7iOnJks1482or9ezKbFKgEvvu
	jhUPziV/fSI+7X9tRK84uLmiNawTYp1lHczJ1MjcQmEFILAAGVzVrJEljfIAxMWefy2WdFXJn8k
	esNJvLpNYhOo
X-Google-Smtp-Source: AGHT+IGhjYmLHDzEmNKUqpVAG6eKWiqlox4OoiaK5qVHeMLESLMtvrrp4P82zdVj5ZoGIPHjeRLB/A==
X-Received: by 2002:a05:600c:5246:b0:434:feb1:adbb with SMTP id 5b1f17b1804b1-436e271d5d6mr207240855e9.31.1736804279261;
        Mon, 13 Jan 2025 13:37:59 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddd113sm193349145e9.25.2025.01.13.13.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 13:37:58 -0800 (PST)
Message-ID: <678587b6.050a0220.32320f.317d@mx.google.com>
X-Google-Original-Message-ID: <Z4WHtK_-DGSGzYyi@Ansuel-XPS.>
Date: Mon, 13 Jan 2025 22:37:56 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: clock: drop NUM_CLOCKS define for
 EN7581
References: <20250112133953.10404-1-ansuelsmth@gmail.com>
 <20250112133953.10404-2-ansuelsmth@gmail.com>
 <15742b3ea7b5ee1cfdeb78657e9dc4c5.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15742b3ea7b5ee1cfdeb78657e9dc4c5.sboyd@kernel.org>

On Mon, Jan 13, 2025 at 01:33:35PM -0800, Stephen Boyd wrote:
> Subject says EN7581....
> 
> Quoting Christian Marangi (2025-01-12 05:39:38)
> > Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
> > should not be placed here. Value is derived internally in the user
> > driver.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Changes v5:
> > - Add ack tag
> > Changes v4:
> > - Move to patch 2 (improves bisectability)
> > Changes v3:
> > - Add this patch
> > 
> >  include/dt-bindings/clock/en7523-clk.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
> > index 717d23a5e5ae..28e56745ccff 100644
> > --- a/include/dt-bindings/clock/en7523-clk.h
> > +++ b/include/dt-bindings/clock/en7523-clk.h
> > @@ -12,6 +12,4 @@
> >  #define EN7523_CLK_CRYPTO      6
> >  #define EN7523_CLK_PCIE                7
> >  
> > -#define EN7523_NUM_CLOCKS      8
> 
> But this is EN7523
> 
> drivers/clk/clk-en7523.c:539:25: error: ‘EN7523_NUM_CLOCKS’ undeclared (first use in this function)
>   539 |         clk_data->num = EN7523_NUM_CLOCKS;
>       |                         ^~~~~~~~~~~~~~~~~

Hi Stephen,

the same define is used for both EN7523 and EN7581, do you want me to resubmit with a
better description?

Both clock are updated so no regression.

-- 
	Ansuel
