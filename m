Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344ED3B8BA1
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 16:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822608; cv=none; b=Jbs6npWhsjZoLtw0qiT9f8vTHDC9vEI8KwFdwfYWT7YgybTC1RcmKVk9rU72ntj0pH0gZ2wZTwxkAuA8nEjh7PrFd4ArYC40yVAs531i7YJj6t3VPhRIlLA0jieIzONPVfd+nc1HtvQSZMc+sO0aGzli/ftk+dzmnct58+cpuvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822608; c=relaxed/simple;
	bh=VTnbRjkRfnE2uas3pcgZxwwolCVAb6XAOATCiHQXgO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZERhlmwBOWH0Dwz6I9drBaZDQ50Bt6AJ4JNSlA1VyvGonNPvrY83IcHDFsEckDkR2OHTCQoF7it5a43HijHWZaVCHYqspLOY2Ta4ivTWRl58AW8oU99W1nY5FN3TBdHaC0UrN4ewVsdPhFBffBHOgi8aDq+1EmLSrG/TfVe39BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/10HsOz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=G3xOrwBf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/10HsOz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="G3xOrwBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784822606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUjkJdrGHF/uTpDAifvyQqEKmF6q4j5F7jAbk0W/44I=;
	b=M/10HsOzCAxKw+rFt9bhpOrxOAQSf9wX94d8+4iFfprfvm6YwH79VgetnjKXh4j/OVsxeW
	mOwZq+PdEauPyR0rJ+24hFHdufd9z/lwW6+pV1xWtmWr109mjzfbsEe3j1UwSUS7SicndU
	x4o9h4qBiSnpURwkE+O96rXdZdyUbdk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-RV8M6XSZMKmXHIbL1H1BGQ-1; Thu, 23 Jul 2026 12:03:24 -0400
X-MC-Unique: RV8M6XSZMKmXHIbL1H1BGQ-1
X-Mimecast-MFC-AGG-ID: RV8M6XSZMKmXHIbL1H1BGQ_1784822604
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f39a46efd9so8488476d6.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784822604; x=1785427404; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JUjkJdrGHF/uTpDAifvyQqEKmF6q4j5F7jAbk0W/44I=;
        b=G3xOrwBf+4zIzRwXkNPxKVZNrGC4lMkogycr+5KPsUITXoDc0wfLOQ2xS4uOv6k45s
         z03lHN3JmUIaVtksdQiWLt1jPMW9VaAdmBqZsE0GB1DEYqU5b8jUvMDXJmVgOeez6sis
         lEUl+mTd/bde6jZZtrS8Et4kndz0sPmHdLjo7KOGLCunxnPYnwHdKNUA0fx2INfnKCI5
         DgoGZx+qaRpEf5C1OGY9InRy+a8YEv8/iXK/Qh+uF/UnVzlYCKogXPzHPJaMjb5Q9usd
         B6aL4Lr1A+0ZKXmfBfQcPbYYt6OAOyobVszBaLtOoNEO/waIqh6A5T1gX1dIGoLk4G2h
         +nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822604; x=1785427404;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUjkJdrGHF/uTpDAifvyQqEKmF6q4j5F7jAbk0W/44I=;
        b=B4WNcKgZea9o70v6np9Q6Qb41GW9fSUx6VdBV4l3lqFgblVo8DR7AZhS1pZ65H0vjs
         CfLlsCg2p9uVZoPixkE4gv6ZtvDOChB3z+TSTUkrFhrZUHknhauG8CIev4knrI0/2b89
         OFFvZ2UAPRJvbpM2jHkC+kQXtvqm9SOUmWc3F1MfiKbr+VJj6jMAZgSJzL4/HXCTGedy
         98H04uLmtMzvAsjz/5ArYqVUMSJksJJDttSZimH48YDdbzOzWlT+vqm9sDq2jbg6BLrT
         vw8xrrOuqXA9av+SX77/BIsvEgnADXvWMbHp55/HiyXiB8jbrL4ntJ54cKvV8dVCPOdI
         ELkA==
X-Forwarded-Encrypted: i=1; AHgh+RrmTexgqsleMEUX5nnqGntdurSrDE7lnv+iFcOhcAVKqOAVu+akhlRcAHZ6H5xeQHzbWbdsAy2dSYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8HhjVGom9rasgZH7d4Gf3RTxHzWi316nUHZZKUZ/rToQMPXw3
	/mxERQ34KjZo6SLCfGF1qKTgtitZ3TrqrQfPCXDl4op1Zn+lpw5Du+1WXZOzeV3xP8Ht5pblSRd
	i/HXoSjgk3ImgHjd+p6g7pC464HPfeCSP8D9/6luvyaYScKqewiWaL0A8+NaoNw==
X-Gm-Gg: AR+sD10EiJbiEB7dn5ZQj431L2V1YIEimjIh96x9cYK0JhPptQ1EAxzPUxmBa/8AcDz
	NAtGW1OGDZMPhryrH0Utgu1jWlHsBZ9XQas23AWOV4QDHUid8GPFTgY6kuAi2d6xyBqRiGRe3Xj
	480XKT+FGllX0sLS7oKJYDQhCMO5NtywwFZI2XWWtVMvNpRAtlZYwA7HACh06TSUrlokwQuQn8l
	LOgpU7gP8zdufoiGrz0F0SHRPFWgp8z2xcqrMZy5HqqskRcnfhKQW6mWAHx3jBNnMB5TvqLloV1
	98OQg1MPJCrnqX85uzFb5WjVKinyhoVivpIGYKFyNvMc64YCRYaVbs40deubqtcMpD5OF04jvo8
	RGJYKFdG/yoHVSPtEkj8EptWbfUuR775vOOU=
X-Received: by 2002:a05:6214:4303:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-907ccfa7755mr33588076d6.1.1784822603648;
        Thu, 23 Jul 2026 09:03:23 -0700 (PDT)
X-Received: by 2002:a05:6214:4303:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-907ccfa7755mr33587566d6.1.1784822603140;
        Thu, 23 Jul 2026 09:03:23 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba672806sm48357536d6.0.2026.07.23.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:03:22 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:03:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, saravanak@kernel.org, ulfh@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peng.fan@nxp.com, aisheng.dong@nxp.com,
	jindong.yue@nxp.com, xuegang.liu@nxp.com,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 3/3] clk: imx: imx8qxp: add soft dependency on SCU
 power domain driver
Message-ID: <amI7SFD1bQjkj6Db@redhat.com>
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
 <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 23, 2026 at 11:05:24AM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> 
> The i.MX8QXP SCU clock driver manually attaches power domains to each
> clock device via of_genpd_add_device() in imx_clk_scu_attach_pd().
> If the SCU power domain provider has not probed yet, the attachment
> fails silently with a pr_warn() and the clock device is registered
> without a power domain.
> 
> When both drivers are built as modules, there is no implicit
> dependency to guarantee load order. Add MODULE_SOFTDEP("pre:
> scu_pd") so that modprobe loads the SCU power domain module
> before the clock module.
> 
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Long term, it would be nice to fix the probe deferral issues via a
separate series.

