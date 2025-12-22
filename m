Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2E1E5207
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766429336; cv=none; b=ZGUyYg6RDGweblpfeHH8P1eKYXC9Eq0wg/m5qyieiq0RWVdyBSROOuJfTMVM027WZxK1jo25N2Z5ciNKbDx6rO3YV740/irMjtbTnhU6w041Jk5VY6uUispZ7h5GNn3CRwOK4OtReeDLhQNU/3nfftY5pyT1al4REVxEJ83n4pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766429336; c=relaxed/simple;
	bh=NU7BZTE9Yj7sLk0lhA3FzXeOwEjqAp3QZObasjzLk/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5d1643DwyDvevDrYssZgOQNupCrWSzcBYgrAuv+KwFSVekh+dqTUHVsGWiwdGwVUKaeL6q8gRNX2pLUfTkKtsrPauvzntn+jztJ6uSKS9ETaK261roAcQDH9bpvrl077Vp4NhMtKJXVpYp9U5Gx011pITPPONrhMzIOjJZBaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOPaI4NK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TU7epQoB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOPaI4NK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TU7epQoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766429332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u+4D8Tlj01NwbwJ7Sfzz7JxK73l3sJ2lS0F6Yeexu9o=;
	b=IOPaI4NKi+5J5AHZkb1kUcI0/7umTSFlrDatKDmsCbUYxeTFjK8GtnwVd33S8NsyCfjNpN
	qFRDPPN8W8Ly88kKcA9/DeDNDK+y8Dq2a65XNmntjo3//GPSIevynGIOI8j4IZ97SBqlDn
	LWTBc2lVNOKXtpaU7Bg0zRnFjxu2D5c=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-kwRaJyDPPoi2_ZebgTHoow-1; Mon, 22 Dec 2025 13:48:51 -0500
X-MC-Unique: kwRaJyDPPoi2_ZebgTHoow-1
X-Mimecast-MFC-AGG-ID: kwRaJyDPPoi2_ZebgTHoow_1766429331
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so53206456d6.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 10:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766429331; x=1767034131; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+4D8Tlj01NwbwJ7Sfzz7JxK73l3sJ2lS0F6Yeexu9o=;
        b=TU7epQoBSRULIqAv53M+njP22qWA34y7b0N3LO6EkgaUIWILYFDAxw232qqnXwwY6i
         hnFkPg4g3rvMWiD4a7IUtzurz26aPFPc7EF9uKFM/nkjyhiUG7H/ehkEE8nbQgNMFOtt
         URKcVkWYhOLaCVKtDXR3yUzlnTwwruK7KqCQjZ0qFs7Z3Nt2yVJq5BpZqDMrHAzvv87v
         sgkkyYGbDJUuqthT+m4nQ+In/TYHLBppkG4SP+vc9zjg9BuoMwYLzbD/oe23kC5fAtoU
         PeenKaJH3pkknwoJ1LL+11yMFMjXyqSVYMtLgQ7AeVK+P/LUyIOnaQghCTO8e+lQHWSL
         M/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766429331; x=1767034131;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+4D8Tlj01NwbwJ7Sfzz7JxK73l3sJ2lS0F6Yeexu9o=;
        b=ALi1mk5uRFuCf81nuVsdjmxWlwe1Q8Xhe3O5Jgrr5WCRHPEI9f/k32RgEa4GkLg+kG
         mSd/znd89+veXeI5WEml8nVgP9WtIiOCeDbzymyBzdHW7WUE6blBpEB5jrcyAWs8UXE4
         FDtO+a1OcGuBds+yOiD9jcZJDx1adLO1ye19+XWIZMwMixaHQxrUbgs0O/Lisu1BSCZk
         P7QBM2fhh7H0oaRNBd6wqxz/HS4pKRJU/0GxOhDiwJnUYpKA6tEryfpZu8TEWwoKS9B8
         7RfozRlUHxyXLTsrHZI4/Ml6E05xABn3+nqz4azk2KDDs2jd8XzCJQ9AvqOX09DOSgNk
         hfrw==
X-Forwarded-Encrypted: i=1; AJvYcCUfbfQRkc/0Mv80bW97OsGs1gaNpvNLeDhydOSZ2+vACPLbhyVP7/dTJY0qHED48wQQb358EHyzRos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YbkcyTAyGfMFBX9K9oQ8CeuMQ68+euMI73jcPDPOx4n9ZKAM
	CW4r8EYIs4Hj8NYDPZGx7xPXD2t1tFm9T82ylPYPc2MJ0TxhbTiZA0qoTg6529/lwI7I45bF3nJ
	JzOTMIW8oawFd2I9BAoV/g/dDcrE8/s5E8J8PVBdjrLxZCTLsv0NfXsBwKc5+IQ==
X-Gm-Gg: AY/fxX4WHbbfBrlZXdpDXuDVIFZf9oPEKNcQ3JWF8NFIzD4v+kXcGgCqc/h2f9jL9cU
	uO72Q+XHAqFkC5qigvBGQiI7c7+rg200DGkEkosKIHMwXqnqRXYr9KFgVNR2fO+1TrW6ouLAu2v
	Jktn0xzep/NjJNIYX6A4UVEvC5+6aXiz49jtxq3VyBZmtZOdY6OUGZR3D51SXN47Zo2x/fmt6Z1
	L2V6dDUijyxZPO/1YmsQ+fzEkb0qmmAEwouUtDAj6ofkfZSLr8L6fPXexXiGCu7UwyhsZ7sEqMa
	OlnS0pIFVNFlJzE8wPbSDK2HsZWpHDG5vRyYCTeX3ShQwXNv4uDj7h9REuY26DBQYkly6R9fbsR
	qcXcGAhWg1INAtiKKIdegrvf1jI9LpyNHmxR+/Q+jXKxO
X-Received: by 2002:a05:6214:4308:b0:87c:1ec5:841e with SMTP id 6a1803df08f44-88d8166608amr169685046d6.8.1766429330768;
        Mon, 22 Dec 2025 10:48:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFijTdoPJMxUAie0Ei+GEBkM/RdlFRvhMDa4MJTrCaVw2VpeAozymdzb5LdL3eiKsbDMfDUhA==
X-Received: by 2002:a05:6214:4308:b0:87c:1ec5:841e with SMTP id 6a1803df08f44-88d8166608amr169684816d6.8.1766429330363;
        Mon, 22 Dec 2025 10:48:50 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e26bsm86467836d6.47.2025.12.22.10.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:48:49 -0800 (PST)
Date: Mon, 22 Dec 2025 13:48:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/6] clk: correct clk_div_mask() return value for
 width == 32
Message-ID: <aUmSi3mSDjx7cmpn@redhat.com>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
 <20251216-dr1v90-cru-v3-1-52cc938d1db0@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-dr1v90-cru-v3-1-52cc938d1db0@pigmoral.tech>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Dec 16, 2025 at 11:39:41AM +0800, Junhui Liu wrote:
> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
> 
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
> 
> Fix this by casting 1 to long, ensuring proper behavior for valid widths up
> to 32.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Brian Masney <bmasney@redhat.com>

