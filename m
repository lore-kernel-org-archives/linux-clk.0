Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE5432E91
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 21:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397579; cv=none; b=K+P/bLoGlO8HbMzgxTSexAvB4wiR/prQRkuqXpxClc3PyN3e2apE/gb7biktfnajasgOJSU3Rk+3kZ5XKfe9ZzbjI1X2Kt2A1tN3ZQG7CeTe38yEruKb5qVgFI37xZpAk2YUNKn18bSKUPXo4lW7a56Fg32asp6kjdZsqzy4nPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397579; c=relaxed/simple;
	bh=PsF01tzSfmrGWR+juK90jp8b0QWZXtzAXTBj5VBqHa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuz0OE+t4LRdId8bHSucP8L2B++FvTwVAF/2fijn4UfyltjsKmej5Tmhy7aWMaqxtfq6OQRDtx3FUwpQwlImCV0MOKUVNAievKvqhA7jGCFX5GleHqKZbIi6U4O+MkbHvR+Yc44HhT+nBdK2b2aFX+ZhbjlQn4kpiIYWLH7zWOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BPFQchfs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ROWBG1pu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BPFQchfs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ROWBG1pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786397577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=;
	b=BPFQchfsAn6968le/xLNeMPgECzIqr7kONUSGFKNMZj/K0LQvzMNFqSkZu4zkUOm9a8zr4
	YeVPMg7EvAdv3ahP9pGmH5g985cbCH9qSeKqcywQBMKxfCTrZ26kA2QgMUoP62dQ9k3ZYj
	HCdSpZWPge32iLA0JJTLIasmTIWfsOA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-4029S7VFPLKVQ-qDqvlLvQ-1; Mon, 10 Aug 2026 17:32:55 -0400
X-MC-Unique: 4029S7VFPLKVQ-qDqvlLvQ-1
X-Mimecast-MFC-AGG-ID: 4029S7VFPLKVQ-qDqvlLvQ_1786397575
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fe835353acso41863527b3.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786397575; x=1787002375; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=;
        b=ROWBG1puqNBfLiHjYOiiotJh/nTN+7rO/inviQ1axQ/KdkGvmITAw+7y9rwtT0ObqH
         ZFZ5k0dSc0blvDt9uHbf8ki8M4i9//jCH3YO51v8In143Xcv45Y2YbuUbzCTr7IZ+Nbr
         9e42q0mtqpGB8BkeC9s0Q7/islQlAgbeI/6vGqJccVmqKmsLMmlol95AQvx7RJJSHqu4
         LiCcYqe6W69FVBCGgrd7W/AWpkTchKK+wRUIRmfnNbwjafoau2Lao6itYPG7i40KkFVk
         TW4+p++sAwwgDr/nPAVXcVrJsuuj3VPuOAbRqfVYC5nCIJ0SjexoaHFHWONTkl8K5ur1
         9JwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397575; x=1787002375;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=;
        b=QIGBHKr5/tFN+gCEJ+dQcdauCPIdrg2tu6Yx8C3KUxdmzMvGotqXjex95XFc14CGcj
         22DJi9KcoyN3Y1kxGVJqh3rVmxEqmhhnFlLnUXgpIe8T5BhgiQBmX/2lS0FDOXnu8y4l
         fST9VG4i8EkXXof1BKxcesDyl3Tqf2V9s1/l8Kjbayrx6aNSG4aA83COd44TEpmblt3G
         10+2y2CuZ+aiL8pWxZLvk5ULk3VoPYjMgAs5woCYU9VFjhaV2WWj0H+PxvrfDa3GKlxU
         ET91ke7IVVodrPRr6gL2y+4Psge3qNLwMtTuOeBvmXZFScQj0+is7sr+eK4hlt4M4k/L
         8f8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq6YlQdSSQMtTNURf3l2yzgsbVB2C+jUBfYyJ+eWkJPS0O+wVOHi4tyqw6ug7+IxflMV1S2glTUotY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzuuD4cu7k2rXZBYMS28UEMXSXeDV+GEqWwv62CRJ5TlDwJsdp
	mpAGeNxxt3pfedEwjk4CIYql/yZ1g+UxwXZhi3IcsBmaQ/QUo7BrQ/JLu2rC7fWjewwbpGaCEa9
	BRqbIbTER8zy6zmjqg9asEyRmRUsEdtATsMlENHqfSu5VW65U8oE3OGy+GWyL0w==
X-Gm-Gg: AR+sD10QtGiZ65gi7oCfGlZFg1oFJRaFgC2FDt75kPVoZ0bYHMQD5bQaw+2qKKmMX8a
	ryroUF5X79UniZceZ8i+Vib9xBkZPq+ntz7qH5Y5/o83unZ4H1c6oHtVI2QbSxJIR+9HzSj0v0Y
	KTAjTqCCDHQB6d9tc3VgucP5rC8ODZbs/ns7OIeR6XgQ/mbqUqJ6eqVzSfqNEKk8iH7hkvpehcJ
	PUKmFzxT99zDNTaWWVoLcBEh2Cxz98Z9hWhjrhx0OtJgWkatAD7P3JC2s6EE4S4EHVqUxspoi36
	2Wuy+z+LWZLEd+vRfBgaZ/0vYdUBMkwhvC8IG9U7h1/5nP1yEQo6OkyULkcYquWz3DPWm+V/IMZ
	xd6uQ5JMprg+Mb5tHo0wNAU07NnE6F8gLGo0=
X-Received: by 2002:a05:690c:7286:b0:81e:6a10:f90f with SMTP id 00721157ae682-8225ba2bd2fmr193701487b3.17.1786397575342;
        Mon, 10 Aug 2026 14:32:55 -0700 (PDT)
X-Received: by 2002:a05:690c:7286:b0:81e:6a10:f90f with SMTP id 00721157ae682-8225ba2bd2fmr193700877b3.17.1786397574844;
        Mon, 10 Aug 2026 14:32:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f079a0b0sm63450967b3.12.2026.08.10.14.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:32:53 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:32:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v12 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Message-ID: <anpDgt6ZlkFE1ONH@redhat.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-11-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804163807.1285869-11-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 05, 2026 at 12:38:06AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Because the reset controller shares the same register space with this ISO
> clock controller, this driver also acts as the parent device and registers
> the reset controller as an auxiliary device on the auxiliary bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

