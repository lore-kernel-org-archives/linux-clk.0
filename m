Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34EB3126C8
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757688648; cv=none; b=nmKgBhraCgo9pp9gwZx8D/Qb6JCHAeW3TBt1AqiXzg8zJqNeQ4t8XISb6cM2eAk7HQQ9TB4HlO03bCxGZB7Rf7rW0wOmIj7RPZ2x0wSTQqim206fgG/bBkZYLNsJSzdwXanvz2HRP0+/OFLjPrFtMtPFYs/ixPI3lBosiqQilrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757688648; c=relaxed/simple;
	bh=nsgqBhuQMIRgj0Foq7lbTZgCUyn2NDAcRteObcMHZAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSrMETi3FL26y0pARExs5ZHslRmbm4pkQ7PqGbnxHGprhS0pksfm5jDnWI3QWPpiCnifKa/Vj7oTuoioMMdwImiu1gt7z8y/jJuF3EVQns/F4Lkl/mQYy+YK5hH/GVvL/FtGqsja7pdGW7WwgMTXD34t5nGImjp5DaB/VBrQc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NVsLrQfF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NVsLrQfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757688645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWnv1uPYTna1ts6VTb5bmSJ4gFzt0Uz75RWyORHBYho=;
	b=NVsLrQfFJ7gcWGfmrp65i56c+GovdvJArTUz3ysX887vX+Swj+RCOiHILo3ZAsDpyz8c4e
	AhsHaqwkfI2whgS2tVdKPqWXDu31eEuFMkxRxoNwByeBADLi8guOJenj9FtF7i0Cj1bDi7
	eS+n8aYMknGy8L5K+9C/HrpUMJp7ht4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-AFt0eKw3OWq19s4FjSL8TQ-1; Fri, 12 Sep 2025 10:50:44 -0400
X-MC-Unique: AFt0eKw3OWq19s4FjSL8TQ-1
X-Mimecast-MFC-AGG-ID: AFt0eKw3OWq19s4FjSL8TQ_1757688643
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b548745115so51515351cf.0
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688643; x=1758293443;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnv1uPYTna1ts6VTb5bmSJ4gFzt0Uz75RWyORHBYho=;
        b=YrJ0iE+yxXR30XquS9mIWOEIDDJJjGlc2tlZ4U+C5zOp4mCJ9NytLtEG42OYREgery
         FR85rUgqM+Qq3hkDjM0DJrpaw8VR6vCNRg9aa5sQmIzRHCWca/OrFG4WsyQGF5iAbpA0
         ZgVGH/uKQCUAc7gpTgl5Jhe0vZceQWJ6KT/VfKbfB6qdxan9x0ZlISXB0Mb1F8BbTE8B
         aHlgpFY9nvnrjDNGLm+fHxH3avczV3tQrAN+eKylrE5Hu/gv2PHCUISHUXgbT2ngw4cA
         VhAwr5ts2l6LdaKjdxxOg3ZtG7oZH7E8U7WIMQ1pwu7E7FMvYf885wx/kDlGoIehCL4y
         yQtg==
X-Forwarded-Encrypted: i=1; AJvYcCVGtB8C7jlDoSPbteahjBTU9LXLQ62lWD9rDJ0Zx0ShL7st72Xm96dWTm1bCObp5B4yk9oSATyZvUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmBgXOaKx631kQReLhQRM6xy+hM7dvZlVZiWyXOR+ZDiI7ixa1
	PPFjkGe7GCFTdt5EHkhBYXQllgs/cTDaJXW3RmbNFLDwqWBB6TBMbHlbSHCNwUddlb6CcvUHvLK
	u3flJWBaNf/kjNyBcnZrlv/UTrwkMw78Cm5CCzbwJV43pZXiIzyW+gCppk7bd9Q==
X-Gm-Gg: ASbGncvPyIIaopWa6ThBmjjEOwjR7Wad1fQfZkrd6aIQRr6coo5HXY2ED5kG2X4jO5Q
	as1ob3/kyLxDvhlbNfcOI6sEPbxbsNNRFyZmpFt6aIfQN7J17EcGsvOaRO4a4n0UAXekbzeO/3x
	Q8u5h76jias2rGoF2ukjiwmVmuW9ezyRYlY7zt+i8/stLBEPSFK0N8hfaIv0oIzAoPDkxOA1hyQ
	rPDp/kEdldyOQg/QpwRAS1/xj4sYo6J4zTjQE3bEap/NxoeEZbvkdRE5IYTQnIymWK0uWc/h7Ep
	fTUcrhIYkcmewuRwQcXGIFjelRjRqhCvoTgQKMEFb1X9Y8Ot0fe4ZgecJPt78QXbxuWROnPmStl
	Akg4htbqwrNVJq3HuJpyZMVas8svaDg==
X-Received: by 2002:a05:622a:5c1a:b0:4a7:81f6:331e with SMTP id d75a77b69052e-4b77cb3caa7mr40317901cf.6.1757688642709;
        Fri, 12 Sep 2025 07:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyVIdYLjBKhorz3T0zQ9Rxegov6rF9Te/Pu4Zg+RAzt3WZQiqnmCsJB1uwM7uqun0gGUSs7Q==
X-Received: by 2002:a05:622a:5c1a:b0:4a7:81f6:331e with SMTP id d75a77b69052e-4b77cb3caa7mr40317551cf.6.1757688642278;
        Fri, 12 Sep 2025 07:50:42 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639a61502sm26238491cf.0.2025.09.12.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:50:41 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:50:39 -0400
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
Subject: Re: [PATCH v3 4/5] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <aMQzP7DamsQWl8_L@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-4-fd1e07476ba1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-clk-ssc-version1-v3-4-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 12, 2025 at 11:35:53AM +0800, Peng Fan wrote:
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
> ---

There's no need to add a Co-developed-by for me. I just gave you a very
rough starting point.

> diff --git a/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> index 1d964672e8553a90263af400367a2d947f755015..d62c7522c92461245d45f8ac0ebd26fa2850be98 100644
> --- a/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> +++ b/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> @@ -12,5 +12,6 @@ kunit-clock-consumer {
>  		compatible = "test,clk-consumer";
>  		assigned-clocks = <&clk>;
>  		assigned-clock-rates = <0>;
> +		assigned-clock-sscs = <0 0 0>;
>  	};
>  };

kunit_clk_assigned_rates_zero_consumer.dtso is modified, however
kunit_clk_assigned_rates_zero.dtso was not. The underlying test doesn't
check for this, so you can drop the change to this dtso file.

Everything else looks good to me.

Brian

