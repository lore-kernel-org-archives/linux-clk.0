Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90553A8723
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352178; cv=none; b=mX9p1b7v94Rj94p+QHIg0BIKSNHQVA8tjtn56qOlKX94+tSkf6kg3FZm+4k7R0ZxGpTxQs9EO6Ije7U5bHR3EuUeNk/wi/RnmY731Qm42iDJZb3crxL8F6HQ+e0/Zfu/Wz3RR89KlMQrNc9Etjr4K++wqP8dMcyKqtlGod+Et+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352178; c=relaxed/simple;
	bh=yoUTKvuvvrI5QWkmLBTnhN5mNxnnhvrO9PQSrdo6b6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teQfdKZkUBL/KT8tNZyDig0ROB1uxpIzLDLCWaQ7ns3sF59hA2064shg/QAZZZI7GfwsrVK8KdLfD6QcFswNl44454CwKgfSYzghjRPqZVcnvgw8jthoY6Mb1quLkzCkuZddAkayabe77Ph2Ch8Q7xXZpVX2C+yDp4WdBdHHJV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dnQvJf/o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YhFqJiIi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dnQvJf/o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YhFqJiIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J9S6SOIwqotZVAJUl0A8DLIjddZv342ULSoUfACurNk=;
	b=dnQvJf/o+ESIMTmqOiDOZe88WlaCvVPD0ErMPOT+WA4ocgUK6EBtHUrI+4TpVvE0D0fVxu
	ejUotmvYWwevLEgHKId3jOL1+tpxiDJSRAWom1FvS6/D0XI2B55fSdKw3HapSXkNNEZ3HB
	fp1R2hBn5lCjmWlBBcCAB5TY0MN5Jso=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-XzFHgvmlNaat63YFDT0XXQ-1; Mon, 06 Jul 2026 11:36:13 -0400
X-MC-Unique: XzFHgvmlNaat63YFDT0XXQ-1
X-Mimecast-MFC-AGG-ID: XzFHgvmlNaat63YFDT0XXQ_1783352172
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-80d927cee77so52581347b3.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783352172; x=1783956972; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J9S6SOIwqotZVAJUl0A8DLIjddZv342ULSoUfACurNk=;
        b=YhFqJiIiauwAoo++Otkx52PkYCP5T0KN5SgORedZ/UaOPygUqjdKhxsQbNF05MzbbX
         IGroacehmtE2mfV4zjbM5C909ra3a8Q7v+LVvVRIq/lt53Miy96h2mBSjhkUxmd5yEvU
         /+v/RduL1TvjUOANLh/GTfAEdif8si1gxvkdgUUg7NxTOCvk5IGzZTvcXbMdxJuJnfYl
         zY+QUHKt1dNcA7/T4KehHSQ0X/a+fOR+DNDpnyaKmDSw+E2zkzzGAXyR1RZgoag+c3wG
         ngXAbq5I1GCbw2x+d0wRmFyGojFyyKV78cDZz08J+kS/Enc5srGylNxvjKpd9vzn7b3m
         8omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352172; x=1783956972;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9S6SOIwqotZVAJUl0A8DLIjddZv342ULSoUfACurNk=;
        b=IszZs3rFEMqy5MsXa8GNreFoa62+7AunNENr2+uSnGQWK6spEPJjamhT3h4N5fgOQA
         KpESLDfNSdeSZ1lZirr1m5M73KXSjfjBn7Qe3Yg59bZAfUYUKUUd1hcCByLhds7goUYs
         79vOT4FZx8VzE1DLWL21nILmgt9wVZFPGzz51KJxLNtgULT1N3utJB1UQXzYLhBnvxTr
         wBFXZziH4KuQYc59hK3kg1IsmfnL35L/CVHqXZq/UvavUGwan+Gkkr2OoF81VkMJw5nm
         6ApsENQnVkAUeP3QE1sqMp4bfVv0xNbbR/Vc6Y4EknpsPJyJwUxuJuW0ttWxo89HaRkE
         msmA==
X-Forwarded-Encrypted: i=1; AHgh+RqEK1bp5F/7uX88itHpgX+fOmYpl4IbRLTrx6DS5K4NTHyUG1CWdDh+AFmJNGbSJ8Pncy+kw+NI+wY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOLsYvP+lbsjbXZalAh5gYtU1tk7B2gTmtcTVhp4gqWIJDycI
	+5ezrU5LEgQbvhkqp4IMzrh5w961X6F4kXx6rWXRn/VWZdtyczzvhA0AStE1yXL5BMwe3jg+/4B
	HRvbZIBjWYe+52pUq24u1WRrRMox/VR3uuBbCGlDAoerBhg5LnbDn0DLKBrZriQ==
X-Gm-Gg: AfdE7cmIqHmCfzUSZJueEpGr5GYYEjvSNBprl4WmYkUEinTYrBlhViny5GhySM5on3f
	aaWvTh8N4nG3yjuwDCxCHNKFyToAPOyUp14MMmdugdohHc80/AM6vE55IoDQadrgLDsASaX4prR
	yS0PfncsxuOpM6ZRvNeVoQZZW8OVDifm7H1TScsPd3fRm+BF6Q5pl2GJCr3IqeRH8LSSx6Ne83G
	/qKpvr3QeXXvaIE7dBIBKz40+23eumM6e92Bwp4NiGln79cJyyAbYKVWESyPKfwSOOPzHVTmf17
	PdKJmimkUlRDrLfkj3lbaHuVerLDoz6eRtMR/64U4q/+LWN6EwnPzap+avk4sTAJiohYFBtj7Am
	wkWRd7wC/WR3AleHquv1bF1HGCp+QWjg7GtbXKrvhQdgseQ==
X-Received: by 2002:a05:690c:670c:b0:7fd:825a:22d9 with SMTP id 00721157ae682-81be2774fd3mr6842457b3.44.1783352172208;
        Mon, 06 Jul 2026 08:36:12 -0700 (PDT)
X-Received: by 2002:a05:690c:670c:b0:7fd:825a:22d9 with SMTP id 00721157ae682-81be2774fd3mr6842227b3.44.1783352171750;
        Mon, 06 Jul 2026 08:36:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783cc5esm59746537b3.9.2026.07.06.08.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:36:10 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:36:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
Message-ID: <akvLaA8oZcKBRLZV@redhat.com>
References: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Sat, Jul 04, 2026 at 11:01:41PM +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

