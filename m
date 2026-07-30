Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061F3750CF
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429363; cv=none; b=h8fTX1O7zNhIO4mUjzDmv2/tuKS2aAlvBROlw+pw8eEQdBSUGZ4YUz89yjMG2PCZ+/h9pmnnf7Ezygqe3lz10SbMsTKNXRMp+/jKEg86miSy54Nvf4mVrpYPFDtZpC31aj7ebDFSQ9i5rQQKwIjvUQB02fUiv6oNaMgXypWUl3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429363; c=relaxed/simple;
	bh=RNgBBgIglK+por2zoH73JKpLlK9pZIRRYloNJpDc6/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLUbESQcXesrJxNLSxlNneejbTEDgVJx8rBIGf1OPFz7dZom/SzJzKuZmsyZRUJBq8qXNnyn9nilZ3pPPXHNtejsrWCtf0WczvbkODP5Omc+LoqzsKE7UVQO+nNX9PwNlAzA/RdKTZJV4eq4Voj0nF39VIJgoo2Uf/W9VNlnJrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=blmqyeLQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p6FQ1HXr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="blmqyeLQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p6FQ1HXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQK0UZKoyz2ZGITRCV0MZEm4Z1Ggizwl/51xOSw6Qsg=;
	b=blmqyeLQ7ccuaXzbIoYXwbLO9xkffpCe+6hGgiLb9DRjSPjWnKOORNNwUfL9yapOfUh6nF
	ELGb/J18CPyVaYufjWrmqkwn6ATflIH5NT9DolG08SqWaqcxsn9NQkqq3qBoYDp2UiC5o8
	vTTxc3JHAoNqRI8QIompJk9Zxgu3OSY=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-z0Mkx6mlMQmo91c0naopYw-1; Thu, 30 Jul 2026 12:35:59 -0400
X-MC-Unique: z0Mkx6mlMQmo91c0naopYw-1
X-Mimecast-MFC-AGG-ID: z0Mkx6mlMQmo91c0naopYw_1785429358
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-668095be86aso5981115d50.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785429358; x=1786034158; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KQK0UZKoyz2ZGITRCV0MZEm4Z1Ggizwl/51xOSw6Qsg=;
        b=p6FQ1HXr0Q7jPwvWwQ8VOtm0o3j/6fEHN7xzTukF9ey1i4xrfXCodW78BwYc8k2CrK
         7PghtcH1mTlVLJEufICfeMD2AlAOtaeMrHFgBU5uu8gusExOiIvn2Hl9hIIfAd9p+yHK
         IZHERX/FmvFvH3xrf5KzlZ3fLXZVmsnMn/3+u1QLOMJ7RRQRMQ3f9neTjQ0Ql5UFThM9
         QnA38YMA4p5XKeu6teHLAcrr5gPgWLZAAtcSoUsaP1lYjpussxgwojqv5Ili728VIMYP
         6MX2MZkNk7kKHVKih1tuByGsmRmfzqU7kXKtkkIZ350N7y1BR+1nP2bOJihz56xb+/nn
         zArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429358; x=1786034158;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQK0UZKoyz2ZGITRCV0MZEm4Z1Ggizwl/51xOSw6Qsg=;
        b=Gc2c5V6OtfUFT02R4gB9yIUd/ZFe5RGVI11HsxQZOTHjnGE7JLH+uAeXrCmRk1P2F4
         mm1L1ccPsIDkww5430AHAfkf0dYmYqtLLKEQvG1Lhk6zrIdBRyjDEi8vxM5RptU9Bulv
         OwkRAaGFjVbhs5lh9RrNfEjDMwasuCaMn6eqp67pHmPIGW8E4OwWDZbWTNCat4IqNoD7
         7FdoHp5YiKGOiS0qU5WMB0uQANdbOlA1Cpa4LIfRsqOQ9qfi26knzT9R5Ud4nFk8ysL5
         ZI8viqooYuJkUuRHursh85BMO9jRNU/alyUP7qmoMj3Roew7OgeXbOgqKB5BvGRUOoQ1
         1xsA==
X-Forwarded-Encrypted: i=1; AHgh+RomD9x9PLGAci6i9jOwk0xgXit1q0j0CpWRyVx2KEAx+c/tcJ7Kh/tfpoGwi7VWa2zDgvRtJSNOWxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmatQlDBLqC0/jAJHtWFZgYms6Ba46bYwCbdA50PvlrQu/EeVH
	QZUSyxmFq79hBpHWtDIeC11gTiBRxiMPZV1CLMXHU8Fw1G+EC+EzEGqx6PZYISwsCKhxoWLojo0
	xY8wBSh39592wseXcuEgYIFakEtSHJcVEKiOsKrvQGfH2gwaWRDhgH+Ek8VyHXA==
X-Gm-Gg: AR+sD12HwapzoCm3/onwhs3iBfMdX+GHKfvmwWSJjMnuNJnoyX7h91Rt74Jnub/G4uU
	RoIyRy1SyCdy4wwonUczoiiSct7qDzCWdzB7smW6TcnkdE0Ls06Z6k8MTAh+vcHbxUsd8WhPy1W
	ZNHFosGGEZ456CtB1i4H6t2iqDIETCiCceH8feyGpi6SAtdXDwg6hYWblUQNsdyqlRFgtwtf5Tn
	VUU++mJHhdOzRfoFkpRYHCxN/04tWnB/+bTbChgDhVbjMBmXasv1OveYPqZnr+7pSdZrpYuLW2h
	cHvJ+YIWnr2CbzApt+MQAsakBqToMtnjtOrJOKNBkSSq+yveMCQfF6Hfk2mq6zylAkp62NdCAo5
	Jj9xqYpHRVrrfa89dRLflK9XsxnJ5dj/7KP8=
X-Received: by 2002:a05:690e:4844:b0:665:e31:fd8d with SMTP id 956f58d0204a3-6692f477c6fmr1754702d50.13.1785429358418;
        Thu, 30 Jul 2026 09:35:58 -0700 (PDT)
X-Received: by 2002:a05:690e:4844:b0:665:e31:fd8d with SMTP id 956f58d0204a3-6692f477c6fmr1754670d50.13.1785429357912;
        Thu, 30 Jul 2026 09:35:57 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6693b131342sm358314d50.19.2026.07.30.09.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:56 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:35:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 07/11] clk: realtek: Add support for mux clock
Message-ID: <amt9avQReRq_hWtJ@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-8-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-8-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 28, 2026 at 10:28:02PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
> 
> The implementation supports parent selection and rate determination through
> regmap-backed register access.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

