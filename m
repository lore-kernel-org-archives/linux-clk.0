Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7354B30B50E
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939868; cv=none; b=GxFACIoeA6v8v5hzAxSbAw4buNhd+iVs3gg8ZJ7FZ/WK4RD9jMoozcyzG7cUP6IfWuP+ou1BD2gr9aWe4TC/7rrS/pVsczIxU6Vl6/z4DU6sAL+Jno54akpRzk0VzG6kn7TsOJgLPsIrVItvSreAINLigvuaR1Ib0iqulNWipOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939868; c=relaxed/simple;
	bh=gpLksYcw9Myqwzil/WQeDaXG00Vp4w5WqIhVKKBj/rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1QHHFMBhJpaexz427wTkJoeMHbD0BFucKTbjshA2R9bD0M2acNPic+O1WnUoCvT6/lTon1CR5BQS7PwDTmvArYm5MLlCa5o6S5sQ6ywp0sKnn9Y7hbNMweEMjGcwspi3SLtTzpID4mYyM5UbmXjP8jF6dwS11leqhNNsJWfMvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UeNbm4yr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UeNbm4yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757939865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wLL8rzXBaL9TL+cKj7734rcnA0rGbpZjb3H9q3ePb+M=;
	b=UeNbm4yrrk+KalPTSwwufWVlGahhlWGKcGHlABSdQIbhuztQODxBnCQXE3+99ZGolsTkut
	tuR2CJxhWO6feJXZOLq54fhmWJKP5/XPRYxh+j5MG4uO2rTLDqTCwZLTmL/NzDETM6q8bX
	/f3Z0O502Q9k5h07pPuq++6C+IM80js=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-OK-QG5eoNP2xU358EmH0Hw-1; Mon, 15 Sep 2025 08:37:44 -0400
X-MC-Unique: OK-QG5eoNP2xU358EmH0Hw-1
X-Mimecast-MFC-AGG-ID: OK-QG5eoNP2xU358EmH0Hw_1757939864
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b49715fdfbso145894061cf.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 05:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757939863; x=1758544663;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLL8rzXBaL9TL+cKj7734rcnA0rGbpZjb3H9q3ePb+M=;
        b=NozXYQGhCKmjp9T/6MoTsSb7hSnFM+goxldrX3X+/WTtTN9OzStRlFi6zdR4Rwae4g
         yyeB9rGNjZcRUxL0416i1dwgsQmaKp9GYm+Y+wGTcXvAp8o+MJbUs648BlmUWITruTEQ
         1BvCkFm74EwUcPtrlG/XEugslgRnhsAdyqz0RC2r5aCwmgD6NWU8lPVFfuZRSBFo22im
         kOc4whLwswEt3lZvmS6QFl5+KWDeQkIpR5EoSCV8gSvn09epNcXvvRs93WlQ9mRsdUKu
         /l8j46VA0vv+jcYoPrYJsc54w9FyTn3sguIKS6P0ekq0JX27zJrWWmiO4EB3QV2zFtis
         Sl9A==
X-Forwarded-Encrypted: i=1; AJvYcCW8xlWGQzcNNFAS7k495aFCZhrRrVmnwkCxYWzbFIBrcWm6PewJ6+0Yi0h7rJtxiY7rpdxf4aoAau4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZv5st2xKQ7VlZdhov+OHaQLcCdBxrSksdxLv2wG0bwLjNp5B8
	IuZfHgAVbyObzGHQJHvbxd6j9wX9j0W2dBmJVNbf6Zjxgydhnvcs5aR9X4e20Fw2Ipk4wf1pYki
	/ZzWVjBqKF8LPitsDPCqmGrk2OHbvNj6bo40deaZwqPmuX2L9pGrYWPJs3NY7O4PDs0evA5iD
X-Gm-Gg: ASbGnct6cfvTJK7CppUd59bhu+NnQf1+Teq1o6sUaWNp9U4wUU5uBUthHrvwsPO0lwa
	cDHdF14q/SrGl+kKNot402Jv2JheSlwXT7pAcKdLwlQJnfIbeDatPTVVUVWyCReqzrJIcpIkhuP
	B8mG9isuNRNeWRmKGv6YXVLOdsGUze680htqiTpWIefr3VRKYpzR8jXqMRO+o49MWaZyNlCuOkm
	l6SXEP3Oq1LNz/PApYl3SOPfxqxRnOj77YH1rdGl4jVJO7pEupMY8rFsZZHs+Y8/8dcatKNSzqy
	KOVkKb6l1XjjeHkKJ9B3RdRWfMnhb+MGzNI1nBFrLIBhhWFTnTDKjq0WWqj9M0BJ8NVwfofadxI
	FdENeiw8xakY1UGE/e4YJjTlskBwLrcc=
X-Received: by 2002:a05:622a:228e:b0:4b7:9d73:ec9e with SMTP id d75a77b69052e-4b79d74174fmr47484961cf.48.1757939863233;
        Mon, 15 Sep 2025 05:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY7Mxjz8VG1qTosAk9YY8DjG+y2q7MXDw84ZmcJWfZt1ziy/I8az1raMUNBU225CmbUCJKNA==
X-Received: by 2002:a05:620a:3194:b0:7f9:7000:f7bb with SMTP id af79cd13be357-823fbde9118mr1346851185a.7.1757939388265;
        Mon, 15 Sep 2025 05:29:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b79a7b639esm26809461cf.5.2025.09.15.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 05:29:47 -0700 (PDT)
Date: Mon, 15 Sep 2025 08:29:44 -0400
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
Subject: Re: [PATCH v4 4/5] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <aMgGuDxzYZpw9sti@redhat.com>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <20250915-clk-ssc-version1-v4-4-5a2cee2f0351@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-clk-ssc-version1-v4-4-5a2cee2f0351@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Sep 15, 2025 at 04:29:38PM +0800, Peng Fan wrote:
> Spread spectrum configuration is part of clock frequency settings,
> and its behavior can be validated similarly to assigned clock rates.
> 
> Extend the existing KUnit tests for assigned-clock-rates to cover
> assigned-clock-sscs by reusing the test framework. Add new test
> device trees:
>   - kunit_clk_assigned_sscs_null.dtso
>   - kunit_clk_assigned_sscs_null_consumer.dtso
>   - kunit_clk_assigned_sscs_without.dtso
>   - kunit_clk_assigned_sscs_without_consumer.dtso
>   - kunit_clk_assigned_sscs_zero.dtso
>   - kunit_clk_assigned_sscs_zero_consumer.dtso
> 
> These tests cover various invalid configurations of assigned-clock-sscs,
> ensuring robustness and consistent error handling, similar to the coverage
> provided for assigned-clock-rates.
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

This looks good to me. I'd typically leave a Reviewed-by, but that's
probably not appropriate since I'm already listed with a
Co-developed-by.

Brian

