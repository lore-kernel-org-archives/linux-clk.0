Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222F31F8728
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850715; cv=none; b=HjdD6AwNipwqbzOUjAzeFQj6u8d+nRZQc4DSQWFAXYZNqFaWhTE6wrsjbSgBG/TOHb2IehR+SgSLX/A9MwH2y5RJv/6BAwAGfdyK2I+iDV/QuI4hhJ/h4wxDPPvDXjkubD+W5cqCd5n9ApckaYXfgUcHcCJUYUQb76rs+gWCdTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850715; c=relaxed/simple;
	bh=AIPYSOx0428xiqsH5Zw0f1PRbiXpWTgmcLOnuEvukws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+Sd8/nFtWSlVlFKul+hT0PfGSoZWYjrdBbda8S+9g6I3VH1LKDjaBPaDUYaOlu51Bh4lUl8qns+O0g/maO+U3cZU0KA3WnwXJ7teG1ZUWq+VLf8zt160SSP6ZCKlfFCiqU2VGi0B39KASyE6mzx1lMYwvjUe/ExYRJLzqrfbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c5GnCm7o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c5GnCm7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757850712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=05ZWoSoCpXTd7kMo2D7eZ+9NOL3Ymr4GMs5H07grvQg=;
	b=c5GnCm7o1+NnWYec5wZFn1Kj5T8QFKwmA3tLjuiKLo+ZLALOe9rsOintMeigj3sIx+jeJ8
	XWMN0KgvrfBLgYzIeYDqhRRD/a/b4iMPcnKkHniAZxm29UnxFpvzmP2ghHcTIdnfKi7hEt
	5AHq23mH/f4tm80Tdq2BQhefgg2Bpek=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-um5jk1KUPjKq5mDgyFWxcQ-1; Sun, 14 Sep 2025 07:51:50 -0400
X-MC-Unique: um5jk1KUPjKq5mDgyFWxcQ-1
X-Mimecast-MFC-AGG-ID: um5jk1KUPjKq5mDgyFWxcQ_1757850710
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-827a6eaaf18so226569485a.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 04:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850710; x=1758455510;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05ZWoSoCpXTd7kMo2D7eZ+9NOL3Ymr4GMs5H07grvQg=;
        b=sTliON+gs2ccQeFe0WiXZ55T+ZWtVkIxbBRHk9LpjA6Kq93FjxC4UetqSSB+rXLzMO
         //94k2vV1ygSrlT4kPusZjCNKgYjM36a1eQJ2B8z5mb1q8iRtsjVEG+WfUNF82h1ROzl
         kqEbKg0hKsSeTKkS+AxkQE7EmxGdHL9/kZi0tzbOa1ssmH/aV/Y8vAAHJxUYSbZO253E
         8Qcibw5AJlrt9W659srFma51QyvrzKCskk3mtuOL4cojzQbNZwgsjKZRWaGyXx+Ypdyh
         UuF6MYSCHeGFjcrvkj+utIOg2XLK2XQ0Ge2ba4snWKxxa4uvXsIlE/bWVFiotLSbYACe
         EKFQ==
X-Gm-Message-State: AOJu0YxgplhBVf0s95+WdbRqUY0l/46nFgxX8OUelAWxUSWEBZixZmAc
	oqz2dCswK8JtuTOsoh5CwbGASSaRCe0RZuZscqUY8thasRYHeFyKgc1PO895B1iv4/d5cvOMDHb
	S4cPwq4k1ByOWl6OkP1f6qNgbVZvrS2leji/Kg0rIYIvHHB1mBOtMzLsAjXWzrA==
X-Gm-Gg: ASbGncvt3b+Hmxah1AYKBQsgWLoNI/9OtXCnnA1snLp/j/139oAJWOmyoTDD818JsM4
	YIjf7sHqwT+jkMxA3OFS5ZCkcF/QgVrex0zOTU/PanlZ9G4l0f8IB+9hRBzImnCNc3B9USJAYma
	cILW9YgfLS5347L6Oi/5ZvTy/os14KBvHBULstn5EEgWSZFz0BMIn6Fwf6vpffOZAo1O8pyqR3b
	IKaBd2Yf0jCQ9tzJLYC9B9boEGwRI1500rd5cNvgTylaaI0Jm+hxTnkC/WJEzwp19XuPQnhEPJS
	PGmkj1UEFQ7MecehFrsZv1vvzmVXCBs3AOFjfUJn8VSp7OntbjGshTcSbCLztzvzdA6O+tT86qy
	TwBAWydr1U8Fd9vTrqrUteWTzfryt+dA=
X-Received: by 2002:a05:622a:409:b0:4b4:8eb7:a461 with SMTP id d75a77b69052e-4b77d14bab4mr135163491cf.58.1757850709648;
        Sun, 14 Sep 2025 04:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL+XRwnX6jGuwsu4a3hT4crD8COQvyH3Zc5Sbne0Nd2VMEI38oG/sulJqcdFsNqwfss3aWZQ==
X-Received: by 2002:a05:622a:409:b0:4b4:8eb7:a461 with SMTP id d75a77b69052e-4b77d14bab4mr135163311cf.58.1757850709265;
        Sun, 14 Sep 2025 04:51:49 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639da9e99sm51613881cf.29.2025.09.14.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:51:48 -0700 (PDT)
Date: Sun, 14 Sep 2025 07:51:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pmdomain: mediatek: airoha: convert from round_rate() to
 determine_rate()
Message-ID: <aMasUV14w0Dc1ki0@redhat.com>
References: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Ulf,

On Sun, Aug 10, 2025 at 06:16:19PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Note that prior to running the Coccinelle,
> airoha_cpu_pmdomain_clk_round() was renamed to
> airoha_cpu_pmdomain_clk_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian

