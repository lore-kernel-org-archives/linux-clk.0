Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6155D42087C
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358207; cv=none; b=kGDl4wuYUnFF6+Xt5Y4+kOMWJ7tLkPkgSAHkN7s9N5gxj0AtGt162QwYRuowbpSJZS1ccY82woxlbFlVpdmz04oWWraF5gLDg55U4qo4ZYiaQmUhllPrMYpajgdJtI7n9bhjkeGg7CXrRulj/eYnNIy4sytPQDnWXcJfopjY1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358207; c=relaxed/simple;
	bh=IkPAsQFWKMi0Ay6Ry3S3gT4vAm5wqkrZAM4RTAHMCSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=co8D6V1bMyciuKYkzAwgkDqgou7l3PeR4jCP8TIbe9nC/4roiRXXwvQi/xqmaecREXRaDZkLsENFnpkwzQ76AumNO9Z6MA+Wh7jgWoeYtDQV2i5BIrme8dXSfQuUx9XngWtsrIXjHTKb6jyxFPu+QhWRMomvBmk4evBfL7gLqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CN/0sMYF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=krRzD2PS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CN/0sMYF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="krRzD2PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783358205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucP00vuSVgg389id6t/z181QkBlpSQnaQFPI67Zm964=;
	b=CN/0sMYFxb1WRatxA+uze9Acjf1VM/adVcZg+hUx8sOpq880D043gEREVrZPW1TIryqDwY
	41ZUJEqWWMrxVebRRvQRBARIxkfztz3kl6GTJtuFQALFDsyH1POQ4YkFty0GdPEhZATx1F
	1er5GZ2yCR5JKRrHQ8HN7Sw+NtntWwI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-QdzMFkFePV-x6lYDR1szNA-1; Mon, 06 Jul 2026 13:16:44 -0400
X-MC-Unique: QdzMFkFePV-x6lYDR1szNA-1
X-Mimecast-MFC-AGG-ID: QdzMFkFePV-x6lYDR1szNA_1783358203
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso46119221cf.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783358203; x=1783963003; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ucP00vuSVgg389id6t/z181QkBlpSQnaQFPI67Zm964=;
        b=krRzD2PSBQzcT2nokR1zS1jq5b2X+kxwEJREZ5pZo+f8UGCrLvhzW2mfnj5tbAr7qa
         850VqXQV0vf0XRoxYlnfT7gP8uYHj4/J/72IgTVb2p+SCrAbiV8LMbm1EKbb+IK+KvbW
         g0LtfwlxTerIIqDRQyhjgb37wc1jX3wYEsyh12xK7XTNy/Mj7wGDWfHfg2Udms1ZPMGP
         qFI7J/CIxQM5gl8U727lYrZOM/mgGh/NRKSXxwJUFdvGPFVbxEPZ3ABTvak7CFCgq9y0
         6cHADAr3nDAYPHe5ql+a14tlgsWPlCA2aHuOa0XASPSFLl8aRv7JiHPA1xDInQY5xkvF
         Lr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358203; x=1783963003;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucP00vuSVgg389id6t/z181QkBlpSQnaQFPI67Zm964=;
        b=KLK9lmScnqjGmG8IwXjqRtHRlN57diH4AegvSF21PPZm8OVvryMpb16qqNFLGWuHF+
         0mScimD7VH1kh0cXG3bP5Lwzc4Lg8zQrQtxA3o8Jq6KO5VDGHasGqLwvVPBPWvHP9Y5R
         xYOy2LGBnYHOAx1RZuI5pHstmaDjDzuN1PpF4XIHYxrfBfREMWlX4Ks8k/ylteu2rRPv
         +sKM6WXGBw99XnV9oWOpR/j52HxFf0bzdmV7esf4CUYeNy+UxcwnuUZ5kmsXiGvYuBt7
         XKnumUAEjok3YeaRQmWG7eVoU4ujoHjBWUEsiwSk69L9JQ+jE4GISttA6+JgYaj1pyBL
         ToqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/d+jnxnSDZpwnvR5fvIS+4lOG5wNW8Ju2kBTeDKbXSyc8W/e6Lt+EC1U4fwx+POkoao2z8pGTfEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP95zIJVfKifVDLKXYER0sDD+xSw0NWbPHj9HMm+P33k4CSqbr
	xkYPY2ZfJeEWgmrwSk4sYP5X9Z26XjXzBjuQ/Ioh+U8tJj7zfbH9IRaqTyXJcebvQSlBV48eALT
	ZKW+PRnp0ybIXX4xknR/TN6oKnwIlcsfUCCAOfySmB/XDV/C3OQDrAumZgug9GQ==
X-Gm-Gg: AfdE7cm7KEftWBO+hWGTnIyBsC5DCyGgHNE/9BOLjScj1eaG/IbVyw2knRNGCgpsHFP
	4rm6OdJH04Q+KWMQWw9PeHuV3JkI7n95sw/HUW95Jw+hgDXyiKGXhhZrHZ2jyi/IOmiCB5Yk/nj
	W+66RSH92WRfv9QMsmDPyF2QmInI8A7Q/cRQboQazVME2nUyN37BG+ES83Z2yRCdnrO1nbrdi74
	UtNN6C1+sZ2/Zy6LxZ7Vl8Fm794QYS7veZ2beBKp8phLbMFiUnHMGtexNVeMu9VXLqx6KdZs6vA
	hIxN02TX20HvMMOP2Ixc8ZmPxLdPJINFC8RBVKqqotewMOTWwbigiwDXphz+CgvpQk4p1wcbFwt
	PEwg62RGQ98Av27TGLdplyE4aUAuDSxgH9y/JVvHL/fRlLA==
X-Received: by 2002:ac8:5a15:0:b0:517:90d2:598b with SMTP id d75a77b69052e-51c7487fe16mr17439151cf.39.1783358203394;
        Mon, 06 Jul 2026 10:16:43 -0700 (PDT)
X-Received: by 2002:ac8:5a15:0:b0:517:90d2:598b with SMTP id d75a77b69052e-51c7487fe16mr17438771cf.39.1783358202925;
        Mon, 06 Jul 2026 10:16:42 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41b19a66sm93193941cf.7.2026.07.06.10.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:16:42 -0700 (PDT)
Date: Mon, 6 Jul 2026 13:16:40 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] clk: ti: adpll: unregister OF clock provider on remove
Message-ID: <akvi-LCvVYYH2r6P@redhat.com>
References: <20260626094134.71961-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626094134.71961-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Fri, Jun 26, 2026 at 06:41:26PM +0900, Myeonghun Pak wrote:
> ti_adpll_probe() registers the driver's onecell clock provider with
> of_clk_add_provider().  The remove path only frees the clock resources,
> leaving the provider registered after the backing data has been torn
> down.
> 
> Unregister the OF clock provider before freeing the ADPLL resources so
> the provider no longer points at released driver data after device
> removal.
> 
> Fixes: 21330497f303 ("clk: ti: Add support for dm814x ADPLL")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

