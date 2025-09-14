Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7823C4FF
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851168; cv=none; b=q9L3HXijhPVIm3F/5WHywSAX8hEYST5MK1HnS5jw9wRzqcgGcoSN/CV+AFCfsbkg/OrHrwmL9Q+CBCRBCtgNj/+yf/OmZPLdLMytkigXC8aqahJTqAyznkV3LwGmMqET8KnaguxLM+Nx7/+AS9WwIH9zHn0N+Pr6PTE4LRA0LM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851168; c=relaxed/simple;
	bh=TuJ6ZyIXo9169+QV437Uuh1TahXjuW3Nbjn9ho+NqUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZt7gLVxYyAuTj0Oy5vJBqOVjJgGnvVvRomFbnIh1+UfaqtqI7S/3GMA6LF5AwmTI6eyDGkphsBDVQOz3LEUCqjvXO7fgma0iU+rq3GVTvIco2SV3ZotE3dt0iJq9RG22eRIsKRF48oAhlsErhRQu0+gQKs9eNobi1uzZPNT3zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HvjdgBv5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HvjdgBv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TuJ6ZyIXo9169+QV437Uuh1TahXjuW3Nbjn9ho+NqUU=;
	b=HvjdgBv5dtcorvvIzCa/326saKZiUEKdlta5bKwgpmVWannn7KNG7gMRPxC3ZZ5IpX34Qv
	aU+lO7bYeI9i5HVFyruYctiiIDXgNar7OtWTDiPALc6f1SipQ+sImdP965jLLij2fnJTWK
	PkivxBJDvzbADcV20CGeqSdG+ywpPRc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-VuCMDocQMom1R3HGhj364Q-1; Sun, 14 Sep 2025 07:59:24 -0400
X-MC-Unique: VuCMDocQMom1R3HGhj364Q-1
X-Mimecast-MFC-AGG-ID: VuCMDocQMom1R3HGhj364Q_1757851164
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5fb1f057fso48512091cf.0
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 04:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851163; x=1758455963;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuJ6ZyIXo9169+QV437Uuh1TahXjuW3Nbjn9ho+NqUU=;
        b=Y7rDjA8RAtMT9dlwJnX80/iVzl1VjuMTMCxNZJRu0hUEHfHAg4lle98x95Qle6OPCM
         PRs8ZBYPlmSY7qJNgTu0atiHb18F0JNRUFy8IZNW5hxyXqhgUAK+77m+pCNFjzW1NW3E
         X+uZwV4Kk4Ul5aDYrFSUviXq666ZJi2Sq3W4h21/dnGRFOsejpliPMdCx9CyeTLRMoVT
         XnuRJ1CTEBm8mJQKpaDtotX6wutd9KijqVrK1QZW750wX/OWfPCvMLxHGsnxKDOyZdDg
         ku4IoR7oQApAmPlespU9IPZkh6zKwJ2lmkd/OAQIRhPLPHRbrT03ZKBAIhcJ6gxamnue
         6kbw==
X-Gm-Message-State: AOJu0YwBYKaM+zwxG8hShcGpfje8i5VHRDX4Zj7HJpZRj2hu0zuP0jTe
	BfdJv5URd1UT/7ceLGURfYkeZMZ55XvtscCaa7bYQE6qcg2o3oXEmDbpjs3w12Mj441IlvTEt5x
	19wBl/YE9/MkFRhkLwMq1d3F3s7oi373g1KGqiqsr5hvpJ+THKcDux1riyG8FS/ZdEtpRaA==
X-Gm-Gg: ASbGncv1yTwCRpu7BkR/XdRyUPU8SMJe4lx6INuK7K0q5UyBdOET8fvU799rjs0KeWa
	70UxSNXwR4jtPr9w6GyPCoznZMJ0VVBj3uu4EkYSZUjUBByHSxmZcc/gOKbn8oA5hTX3b4hljg0
	sMbfp5pgaEBkoWOu4cOt6YiE2sAehitictKf6vqOjLECTASWZLa57LYhKgPI6MUAG02xbnBh3vL
	jfcZJTHJbr1fwHIGGx6962e37eW4rODZOhSlFDA7IsE/EXq6Ymmoy78DfDzGddGZU/MT9DCwelB
	fBbgSerK/b45S9cz+nBJ9xIWxMT+fXy/hBVgvT/4vJLvM3VKsjpOWYdDIPCy1+kYwZoWmX8cauR
	I4bSKEuMbyHgiU+r+2lqoZFu0sPM7pno=
X-Received: by 2002:a05:6214:29c2:b0:722:3a59:fd9c with SMTP id 6a1803df08f44-767bc9e3085mr125308556d6.23.1757851162703;
        Sun, 14 Sep 2025 04:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8iWdV2eUk9Ftv51+HsH9mmPirIh3yTgTyTqB/S+vGeXIJXMY6wV4xvkdS+fQXOzonhJtDiQ==
X-Received: by 2002:a05:6214:29c2:b0:722:3a59:fd9c with SMTP id 6a1803df08f44-767bc9e3085mr125308326d6.23.1757851162326;
        Sun, 14 Sep 2025 04:59:22 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b3f49139sm58611576d6.9.2025.09.14.04.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:59:21 -0700 (PDT)
Date: Sun, 14 Sep 2025 07:59:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMauGOA-9FvJJ7eD@redhat.com>
References: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Thu, Jul 10, 2025 at 01:29:05PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the media subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian

