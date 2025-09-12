Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C1311C2D
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757688678; cv=none; b=OIF4a3d4jMJvh3EeuV8N18KvRWDZ6H/nP5joMpjECTJpAhKW7hOk/bhPObawJKt+b5t7uKQrSNyNsQR+VjMKaBcdIe5QOsR8wMUhWIKLIrFIAtbvw+nmRUGyAcY4xmggzN9tahNSfusJYLtptpvWAAGgDzO6Up4TF2ULqozhRVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757688678; c=relaxed/simple;
	bh=uk6E5Paty7fp1wof3TD0JBLDuNVPgNqH8AUiWEIMf+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiaiQHDUI0m+HhuGMozn1pimgNHS5EKH3IYp6uPy2e8Zz+aR4hb0zuBZznIPcyml3z2o3JpOaz4cgfi342ousxYMyOBJxqa6UZuN/b+d5GJ8jyraj2min0WFsBKQuZwl4X/fT6Ra3HcrhGW9ZK6C/Y+Ghs+A8Mbw1EB7tuQrYnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iKIr1OvP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iKIr1OvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757688676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NU+SVzKeTWD0+BhYK3td1Pqzo+tTZOjwzHuyU7qJoZg=;
	b=iKIr1OvPFqOM54Bae9o3VBrP3eoAxITH+vi3c6A7mMF0kd9dGC5uDB2KWmFPn1TV0/H6N4
	eroVOKHkrBPUGeluYpGWf1b0QgURUNHQcBxmCRuYMSbOjWhugnEwENwNrqZlnDGyj42Axd
	htq6FZiKxI+wVbAEswQqXzAlc+MgbII=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-zsI02cQCMw6f8ZLoCFSbwg-1; Fri, 12 Sep 2025 10:51:14 -0400
X-MC-Unique: zsI02cQCMw6f8ZLoCFSbwg-1
X-Mimecast-MFC-AGG-ID: zsI02cQCMw6f8ZLoCFSbwg_1757688674
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b49666c8b8so42032811cf.3
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 07:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688674; x=1758293474;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU+SVzKeTWD0+BhYK3td1Pqzo+tTZOjwzHuyU7qJoZg=;
        b=gqzRfw3R3/WEqJcKt8JqVaxGiMQRh7L2tgEqDThfEV3kT/p2BUHW97GcKUHRaz9c38
         Rg+1KkFHBjseSbnjbqXfiBtdGkkiB092XXd4UPxxo8TIOb2YrVuyg94a6gvy03Cbzlnw
         xY3HyAbpxgN3hnr89VXfi42peBAXw0u7Yml3oGIZ2Did33TVDvxBsWonJNFdTHChgPAd
         xwbzDXv3Ci7Ol9w0zHVb2MMvXF2wOCFvk38xEgUqXesefaeNtIn1YCbXkiDldHn73RWv
         3g6CXQuiN1XyhoafT9di+au7nJ/TLPpaxhiK6TVmwzYA2fS7fPjNhOVZo8+D9gaPoeDC
         5MeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqWQVd2lY0zJ8YbPFUn8glxt+RIhkvNoFz5LwyjOFUoWIJWu9n74XuQ9D4k2hPMGT6nmQmlC0UL1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOsqmISFK+uw8Idk+k6+ZL2hQiF2uCaCWdEDAoNRIREE3wJXU
	QQ19G2Yan5Kib4mCsuOkTK20X1JN5qI7LvA2wb9mklzKwL9Srr6ntyEEKLfDQww4j0KAuRdCHDK
	b3xegNZVN36kjZ8FxxprqOrdWW7Dp6g/kvUXP8Ttry/M0Sz8u45eK/wsbyRd9hQ==
X-Gm-Gg: ASbGncvMCI7jw5Zwu5lZFKizT1smhAakk2f1V+YY62DWBcGXPbmtgPVIXMSS6Rp9Ngz
	ebdjH+2C1px0AqBt9//utRLa3HXiK1xXnlenWtdEgHd076Bl6TGx3rToFlm0V8FXmm1jGAEpHsm
	M+NDe9D7rT9jYgDEW4S7AGffeSIvXjzxM9nzAJLbg/5UT/KindlyH45tU+gbzwP+TU5eBEhkzB1
	9aie2Tuun7/Lhi5XhRCeKPZZes2DpG0xYPvl1V6RiTo8ZlU1o+T/EsRtPhyKssADVQXegWwh7Sc
	DK0PmYFInrGziZtnV98bkycfHm98+NLDcO9hIDpS3h82W3rXSWCxVd4Har69b+rTU6jkiw4Tp88
	+1YDGNEiELymVmbATeEF0WnlCN4CNOA==
X-Received: by 2002:a05:622a:1803:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b77d0cc905mr42168431cf.32.1757688674177;
        Fri, 12 Sep 2025 07:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKHaF5tvFQHHNEZPu3AfsN41wRwe2BP++0UPlIuNaDPH6QWUiaDDqVyOq53mlk8SSAOAXHkw==
X-Received: by 2002:a05:622a:1803:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b77d0cc905mr42167931cf.32.1757688673567;
        Fri, 12 Sep 2025 07:51:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639dcae6dsm25920811cf.39.2025.09.12.07.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:51:12 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:51:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Add spread spectrum definition
Message-ID: <aMQzXdVHOGoT9y4C@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-1-fd1e07476ba1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-clk-ssc-version1-v3-1-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 12, 2025 at 11:35:50AM +0800, Peng Fan wrote:
> Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
> center-spread(1), no-spread(0). So define them in dt-bindings to avoid
> write the magic number in device tree.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

