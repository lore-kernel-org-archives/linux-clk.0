Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F1372610
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766684723; cv=none; b=j+fnaJBfuzS8c9iWR4CEzu48igEE2fy2HgUAkeIARw8/wspkcae83Kg7Y7uPxjyLZZuKfqwPgUpc400PRCPBe7VsJSlnk3DW72Ho5hMsvPTC/Q0U/I/v7HX2VNU1sI6DwQDakBUTyYguvn0UQ8xnVm2g4v6dtQ5uzGIjcnDp+rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766684723; c=relaxed/simple;
	bh=SXDrarIQY0Z2AeMuewgNa08p+CfUmtiSq/8BvZtB57U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loRFgK9BQy9LfRjSRyLAPIYgYLIzgyIsVSidoI6gUpiv4bXRsYaMS1UrSiFe4NV2qr2WC2F5yvk1TkGyLOQFjiDkh9HZVCXCt++rcA9I8HS7TKaeaiA48VeDMq7VnD358hbetnmMc0EUyA7XImUjblEffKc/5bNNAzXZESpRM8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JUBdCIfV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TlIrMumo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUBdCIfV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TlIrMumo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766684721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zz1xVTvh572lJX2qZqJOG7cy24vvTwbo6dUFp/NuXtg=;
	b=JUBdCIfV6wgGs8OJiGD5iG1yPYhzaw9CgOf5hpL7z0cFVox5xb/5RRFt3p3ECOZftjVPDq
	+viVM8uZZnfwXwZ5Grhd8izd62tPhHaaXxDQ01NQwcpkPDaBVy3oANvYn+5lPZmFWVlTiL
	x+SaPd/XPbDo+7RRCiZBiOuVVzVhTzI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-ayNh_460M5yw7iXWacq--A-1; Thu, 25 Dec 2025 12:45:19 -0500
X-MC-Unique: ayNh_460M5yw7iXWacq--A-1
X-Mimecast-MFC-AGG-ID: ayNh_460M5yw7iXWacq--A_1766684719
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3388703dso2383608485a.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 09:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766684719; x=1767289519; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz1xVTvh572lJX2qZqJOG7cy24vvTwbo6dUFp/NuXtg=;
        b=TlIrMumodlcJx3Je3wNvUVTE7+E8YFNxbjNysF0UgHyF2SAbyj8RmtOZfLNQLfAsBy
         rlE20S1DOD1wqU4YEw02ZlBZn256KXvF7jGJ13suATcUmzGpo6U5qUhpkaNg3M9Uu9D+
         EvJyvKa1Lk9bdIcdkT8OB6ZgwIhKtihyPTB7FkHdNlKEtASa1Xu24SZL34LOnvWfOKTT
         Ru92d7Gl7sA7MBwYICRW9fiZfqMvq0VkV9KyuSTK0ru4QGPBW+ZgHkLBx8Gu7HQWfqkc
         5/uayZ/3qRhTnMDMjsmgS4akRKJ9YW/uq+4PuSH/rW/ryOgNcDRAxq+aLc6qhj7fU6Sn
         N44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766684719; x=1767289519;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zz1xVTvh572lJX2qZqJOG7cy24vvTwbo6dUFp/NuXtg=;
        b=iSBspuJpPa6tX53WvF0Qh9XhYTPYpxC4CvCSCYS2RQhol8f8YkOZQaYjiGb6KwzVuZ
         bub+9xdRYVHx5OHkEaJxtLubCJWCcEpPak4iXlpt3wQkX9OJX5P5fEbqNrM1MKATpNTF
         wPQ8TJR5oBPkL7LGsplIpbxxxm0/Ma++JhXnKTEuRmFgSbxnrOoRqvVuX1W5mjGEBjDl
         XQr82UsrIKhgfS5ImZPlHeJvUOLQmmy8fp89Qud++jWASXgtFznoih5i2kHULZ9/cZJr
         a2pyDWIHxlJXxG1Y6qYu5T+cnFr9NyOcIro/NSwTxFZ/io59sB3cbm2RpluvmJgvoL+r
         hg5g==
X-Forwarded-Encrypted: i=1; AJvYcCV3qUZN/EitQ45WoWP+y0XntY3h9Ch/UCbZIIWjuTXSH3H14TWFUeBPqrNYRK67ZUcL93QoWEM9Vus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxV7FlMP0489lsNHKnG3kV2ZnSbEp2GpnCvb8Cj0mwLdQpWp5
	5v1vE1pLNPwlt1/kkOwbHT/Fs/ujuYIZ6u8MzB+V57JoE2X7Rqzq5oWHo5ZJq2t0IMMtgZ3ocyF
	q6ofNjfK9dBIcIWdsSCsllbk9VEAa84pbhnmiTuMPrvR41pBDTdp1XKQp8b6TEg==
X-Gm-Gg: AY/fxX6P9vIradppA6ntjUIp6LajuG7SgqCUONM8/WUnyfIAqhGHMUtLqoaZjMjd2di
	GUItP5NqfwzoVBQ+/NFPiRJ9xN/CyxDRUJFYBDMEZzoOmvM+TG3Cc3gULvm8I+u30xyEo7/4K0d
	45gP8av94IhskuCbJiM0VCPCnUQm219SZMLh0GgLebPbISzLpdsP+w7FouehZTnmptOR2J0nnbD
	8yC9cSTOPB1h2D2o6csIqGFpduqnRwnCpdYRj8Laci16lYnXDyJlXWwPX27BGxJFp6kCbdLQm7c
	in/YmGeM9rVZ3RB708jrIhmRsv2CvCZ8EsivApkaBnAKvAswNzTZePv7DeaSDG8keCyXS2GfcEe
	wCNl/NQEiI8h/JyGaGTwrL9Ad95ze4lmlBzgNa54w++9c
X-Received: by 2002:a05:620a:f13:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8c08f66bf3emr3080551085a.29.1766684719221;
        Thu, 25 Dec 2025 09:45:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/E6LsKwvfEMHC7uT4rrxVGLTNsXyb1jefziEMNS9y7ioMFDWn6jnZ3Lk+Vmjy/3v1Ei+vnA==
X-Received: by 2002:a05:620a:f13:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8c08f66bf3emr3080548585a.29.1766684718918;
        Thu, 25 Dec 2025 09:45:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm151955716d6.43.2025.12.25.09.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:45:18 -0800 (PST)
Date: Thu, 25 Dec 2025 12:45:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v16 2/3] MAINTAINERS: Add entry for ASPEED clock drivers.
Message-ID: <aU14LCCn_Cnd8tV6@redhat.com>
References: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
 <20251224-upstream_clk-v16-2-8c1318f56c3c@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-upstream_clk-v16-2-8c1318f56c3c@aspeedtech.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Dec 24, 2025 at 01:37:23PM +0800, Ryan Chen wrote:
> Add support entry for ASPEED clock drivers.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

