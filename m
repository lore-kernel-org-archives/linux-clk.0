Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97535212568
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689439; cv=none; b=OSb1XE8GF0pzAzkFH6pgVem2ZD2jN/mGpgnTRGsJohK2GN9sv9/yaLJJZ+rWLIkNT+0JC04EKKuR0YK+lPLiLeGcZUzToW/2bwXJ+/ZcxN/0wd9nLgJWA+Yic4bujlF5Ef9qEMBSYkUxERT4nOkI1moK8YCm89F4Ms6hWyATr8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689439; c=relaxed/simple;
	bh=DS83X1AnvvzLm+bCai80VK+iKHbBFz40tJWSVtqRlZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6UfSehgFq/Y4yGG4Cw7pFTarmJ9eDYZATPHbuDabgUK9pr/IqV9N+bqhOPBacUJQBaSKWqbUksPjOC2aCnHQrawhiBNA9CyhtM0BFCjkUTWi7u/TM5Krn9qQNglKLmaDhejHtBeyu9DRvIOP0apOzBWLHT0hWpJz5V9dZ+zg+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YDhVXGJR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YDhVXGJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757689436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ql70NaELGKTagorgJIq5i9FlqS1h8VPOM70ZysXf1/A=;
	b=YDhVXGJRhQnZwr9pyEWVgvwTAL6+ahv13P9ZBnXBnRZ8ro8UhT4OTlsmK0MfyK4F4xD4wk
	NSa3aqksSZyySByDgDBpSptbVcddv1lmWn7cL78v/EgeF2gpHCC7pNDmoP19d8iaKkTfnf
	cIL82V7Zyb2/85X8mXePrfdZMYcMr4s=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-YPaybJLoPzeoWuEN4KLlQg-1; Fri, 12 Sep 2025 11:03:55 -0400
X-MC-Unique: YPaybJLoPzeoWuEN4KLlQg-1
X-Mimecast-MFC-AGG-ID: YPaybJLoPzeoWuEN4KLlQg_1757689435
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-73050748418so16871127b3.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 08:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689435; x=1758294235;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ql70NaELGKTagorgJIq5i9FlqS1h8VPOM70ZysXf1/A=;
        b=pwt2vrOVt79U3YcYJo9IUjev/djWIF/3U59dnMWmSmkFYVmIWbzEUx9h6L3KIHbJ0+
         BmEi8zLgpv9tfbLyvVD3LEv/dCPp9+jtZtJpv5benmI0K5nuS3/kyE3AOOKQyq91ZC0I
         yLjxClfP3BJ08Lw2BhN6mzFnuFSvwWgixLepsV2YYssvTu1E3/E/R2gizAH2jg/OeE9J
         MhOHwoegtMuQU7RUQEfFbSeaOJicc8ze8z+BSNiDE+Tg45lSRhNRlkh2BgrT5KfU8yV1
         8QdcCiPOwIlQ0sHxO0j4eiEhpUQ04A13FBPU1JSrCssKap9JvFQpUecCX2PeH0bnNiLN
         eAzw==
X-Forwarded-Encrypted: i=1; AJvYcCWKmYxH/oBfmf1YGTEDhMdXsaFZBUVfNpLaalEI4P73ItNMf4mV8KzTT7XUv7tBqcv6sA97L409Auk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmHVgLqzVsQrzXRYqyV/39LyFe7FfYDKAjnD09KZANQ4WAtLe
	oXu7yBaMyQ6jlR6O986b7EU8YAB5UDb3wPyUsWVEFyAC62v7aXeLsBxvZo8OmcXlsxA3V1o1Uw9
	CA0UZiJy1yFekL66i9iFePb+tPiEmjaoHsH+HB8L6q5IoXQ8SeJy8AemdoTTC7Q==
X-Gm-Gg: ASbGncurqGZK2ROkSVspV0i/5S2ObEVvO+6PAjLzZ+vUjaxrYiw72uZbsRGS5ROkUv7
	aL65vdz+sVUrPZ258iLYmaw8cM1Nak2PsURV0mi5BPENdZCDRsdS+HWrLOCeP2EPCTZ2OAc/vY4
	HXgHigMAi1i3xZ/us4Wa5PDSnOT4M+VHRilnt68vIFvx08+MOSixebEUPworY+W5+VRKtRBoKpj
	z4VklgZE80yNrlbLziY3TY3u8SO7DB+votxpmIv4JulDSzcd5b+Mm14LLxZUdoG4hyFmeIKWb0U
	snDjiPfXKiy/ROzzy+223c+V6pSwV8VUYpIGn+uJrGtfHJhYPUYH9zD4/8UuwD/F9zW7Mw/EAVe
	MP2bX/JcaVUaWzs1jkOn2sybJQQrxBQ==
X-Received: by 2002:a53:d30b:0:b0:5f3:317e:409c with SMTP id 956f58d0204a3-6232f8cb7ebmr4945687d50.0.1757689434720;
        Fri, 12 Sep 2025 08:03:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAX6xF2fAzdjMOvplSdvZGKXrlcHOORL6WIZPj+3wYjGbwX4wiucOJhgAsE3V0lTTyfzcHDw==
X-Received: by 2002:a53:d30b:0:b0:5f3:317e:409c with SMTP id 956f58d0204a3-6232f8cb7ebmr4945647d50.0.1757689434009;
        Fri, 12 Sep 2025 08:03:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c88db181sm287951485a.4.2025.09.12.08.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:03:53 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:03:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: st: flexgen: remove unused compatible
Message-ID: <aMQ2VveE3hIgmOBI@redhat.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
 <20250912-master-v2-4-2c0b1b891c20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-master-v2-4-2c0b1b891c20@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 12, 2025 at 01:36:11PM +0200, Raphael Gallais-Pou wrote:
> Following B2120 boards removal in commit dee546e1adef ("ARM: sti: drop
> B2120 board support"), several compatibles are left unused.  Remove
> them.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

