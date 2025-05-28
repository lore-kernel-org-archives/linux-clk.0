Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECD22222A0
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474649; cv=none; b=b/D8pmn9WqH6L/1DuI2tPPgxqrEHWAoRuBSidi+hDka2doJPp+Es9uOR6ZEt298SPaftukD72Ogo7aBcJWq9DtClV40D5bgiqDSO9QHVgGRaU94S4pk6QTtbu5cCunyDHnDIaD+49XwpcPkCvQIHo98P8ZDrstrZfc13T//mLJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474649; c=relaxed/simple;
	bh=BY6dFa5k/P0tKoxhYLdQqm3+SlrYCY9k4tsnrB7ah5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWL1rQCEMKj72KhC43rsxCgUx7dyoYDjWfb3b+GsHmiE+re+73Q/anwSAnk87DP9pWS3GDToFIXERO9ndaseiM+crcQiwYPwkLEQ/4LaVXqJNwbxtXG8UqmmpubUIpSiqGuOWco5evAkrZGZtJKWZs5yYlA0ofMtlWA5I/Y+T3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NEmS/SWh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NEmS/SWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NL8V5upuEYKS7My4G1ky5sPL2jdPACQefsgMNdleTf0=;
	b=NEmS/SWhnDZ8SthSSV5S1JFnGBM3f/kc0ehfew6pf6vSWO+EesrfedslpxeC13XGFfndSw
	KR4sYr16M8Wf7uQl8rKoQbucdfb4z1Bun0IX27AcCyJowIj5dZpaM66XcPH0WCyapDXCab
	XyJoaJA93jq7fcZKpl+5S1KBH/SGlsY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-7ltGb7PQO5uA9oO7oLVvvg-1; Wed, 28 May 2025 19:24:02 -0400
X-MC-Unique: 7ltGb7PQO5uA9oO7oLVvvg-1
X-Mimecast-MFC-AGG-ID: 7ltGb7PQO5uA9oO7oLVvvg_1748474641
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee988153so48361485a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474641; x=1749079441;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL8V5upuEYKS7My4G1ky5sPL2jdPACQefsgMNdleTf0=;
        b=tapUMsKiNOw/xHq/uIT8pQoiMO/WVvAQEngS10rR6UfNO8/wjsFsgvOoDtrjPYsRlw
         L1cpuC9mdiMe98iXd0UrgsZAzDjpR3d93H3+RlXB7DqHFiclj+R7PEj2/KyM7iLSJ+AT
         Tbc2vn7gXAdZ53c10E1LzfU8a2KCS2OgK0nj7W2zT6gOjdnvBmGTLKjDs3L7bQyXgtzs
         MxpfDXBsG+gY8ffyGwzZrxK6nErLKlHZU/xgEoeMZKNgyZ793Q1lek1vpqtTJUuSHSeJ
         biz1sEN96WHhumJ3J20mukMr1wdFqdGM8fE5hYDcn5oS2wt5R3J0lPrOfp2KZ99L+NBz
         M/3w==
X-Forwarded-Encrypted: i=1; AJvYcCU8lWJLoArArN+ca9z57+ugOZi4YwMvBj0SvJWYW2QOLkTHtg/VEs5pQixfWOy9th8wQRIS2Q5O3ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YyADPmovSMys6CfCwI/fGMWkymQAMBorXD1Iw3oSU2seM0ENAYo
	bjW4rOt05zXmFR/Vdfg2aoPHjRhuAzcQCD38xJqxKJnrKYr2C0Qkjzm3lqLEKbZ2YRIYvdw2lbe
	cnCaGq32XEfwfvOqgtZ8c3GMQZsnhJEL17dz7yQv0ul1HXmD1dk/M4HoanHzDew==
X-Gm-Gg: ASbGncs9zjYFxbcAE4YNvgPwzCS+fbJ5VEupMZji7l1eKKLdMNO+TMA7xXKRY6Sgcwl
	3e4TQFYc5V3w6KnVs+SgKyKKdEcYvpy/090cQ7WC4qnvOlSX5gRGHInlHmpowZ6veUOfQ6p2oEk
	wbZ7YfwO6crwXNPIPlSuatGkP0wERAM7jD+5PMsF7LYegciA1kl4UUTZ6G5pqC8t0SP04NGeBa+
	m1CWtaTNzTQt1mD34SpsFHEdrif7OnXtslAEkc77mGKGGfym4d8fEy6zrby305Y5lgnBs360xym
	u7WMm3Gcga+UVasX+zpzupKQKaVmAkLXsf9f3S5EyXmq7g==
X-Received: by 2002:a05:620a:4046:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7cfcac2a902mr664849885a.49.1748474641438;
        Wed, 28 May 2025 16:24:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD4C2L/pXxMI3Udf7OOd16ifJeVVzoLPeYQqx/Fm28waYypOeikdv0j6zbEKCG0HmQslyYYA==
X-Received: by 2002:a05:620a:4046:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7cfcac2a902mr664847085a.49.1748474641151;
        Wed, 28 May 2025 16:24:01 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f8ce6sm14105985a.37.2025.05.28.16.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:24:00 -0700 (PDT)
Date: Wed, 28 May 2025 19:23:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com, mripard@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: preserve original rate when a sibling clk
 changes it's rate
Message-ID: <aDebD9V0sAoH2NJa@x1>
References: <20250520192846.9614-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520192846.9614-1-bmasney@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, May 20, 2025 at 03:28:44PM -0400, Brian Masney wrote:
> Here's a patch that helps to preserve the original clk rate on sibling
> clks when the parent has it's rate changed. More details are on the
> patch.
> 
> This series needs to be applied on top of my clk kunit tests that
> document some issues that need to be fixed in the clk core:
> https://lore.kernel.org/lkml/20250407131258.70638-1-bmasney@redhat.com/
> This series fixes an issue in the clk core so that two of my kunit
> tests can be enabled.

I posted a v2 of this series with a new title for the cover letter. This
combines my v1 kunit series referenced above since I made a few changes
to the tests.

https://lore.kernel.org/lkml/20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com/T/#t

Brian

