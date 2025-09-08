Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251F30E0DC
	for <linux-clk@vger.kernel.org>; Mon,  8 Sep 2025 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351369; cv=none; b=h3yvLnCcbXJ5XTS9uJ5/M7FuqK5Uu1EqiV+NS7puYR2qaqTiyEu0VHU6MXtTFKUcy/1MQdyLpjagLocuuAfJzPuAwnbBnl50bTyeri8vNpNyOUkliSMBRVmiEGLpoKH9BZ9pjJI+Sxsm+DbmIub0Pn2c7A6oH5+Utkp5BYN+q8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351369; c=relaxed/simple;
	bh=nEnJefsPnqX5TFlOhSjy/aCZuFSg/cMMij5f+DaISJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7GB5dT7fmHmtrCD21zJhuyMz5dJdWlBoymKne7j/6SCjfA9dOdZ4/YyVZYTCHBV+0h6qPuXWOtlbMRKQtuMiWhGbhx/qEnzYpSU+u3PyVUE0uLhnVJsVRAu6c1bcg54jAIa9rwuo3PXHTsCOthTNgLEOGGjoxz1UycIfUo4bvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fXGxRSoW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fXGxRSoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BjGSfoNLufNCcnOWJhIHlOPvlvWzDfGM2mQB9ETv4Jw=;
	b=fXGxRSoWQp2ltO2jfnNv1Z6FJiUdgWBc3nPePzvt5J8zwnFbhKqep50uzIS/5hTS8u4U5A
	BIp3L9oUT+cCa+dO1im80zDno+wSnvc8IMXJGkiiRKUNTCarm5NDkXelo5IlIJ62f/i6fU
	qRxL2xt4eFKzkyPbTCS/e5EB/Cqerpo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-UmXBHUR7MK6PWbHNR4Ur_Q-1; Mon, 08 Sep 2025 13:09:24 -0400
X-MC-Unique: UmXBHUR7MK6PWbHNR4Ur_Q-1
X-Mimecast-MFC-AGG-ID: UmXBHUR7MK6PWbHNR4Ur_Q_1757351364
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-726aec6cf9fso153631286d6.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Sep 2025 10:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351364; x=1757956164;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjGSfoNLufNCcnOWJhIHlOPvlvWzDfGM2mQB9ETv4Jw=;
        b=ThdVFbWq7EVqYeZzTWIQR7LUZxHxEbjxkaDxAdLxMXXQ71luS18gV7ly/ddivyOtM/
         bDwvMd2zQA2BB5ez3i2cek83GGYxZ8QijJj/SxK/e+CXuWjqrT0cTPwOixGO7/IrC1qR
         E/ZO/xsqIEZhSXiZ6PIOZMZ9zjKQx1ajbr81VJtNukl6ul47LIsb/TgsC4t24drOfcT4
         NhUUdu1gUn7FMyatA/ooyFbtmTO4qo9dxoclWwAipSW4bg6UxUQkNX3eBiH02jQI5vde
         3o/34gnwIwBThjwG1icOtfb6g4pVqgSieS9X9Woy5gPzshX3UqF9N0QpqrP7AlYdDFjZ
         1v7g==
X-Forwarded-Encrypted: i=1; AJvYcCWILtBMQaGbw9zSy4bBFxc/+XrIAdc0cvBDo0rcqxM9gkqwb0LDk97cacOMN4biQYO2OTPxmmRVoTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyry7JoV3lGIZzEM4bUXar8DIzZeAC0kGTpGSSyVCoGwwMnqE0o
	PBJrYNN7Xl7iB6DGQQedl1FGdnY9UYhbu0MD9dMo9KyTVDUIJpNnHZcJos9svnEo8SPjwy1K8Qq
	XF6UgjRxWjqwfCD8SOSAgTMQU1v+N7l/Xvz4wLn2gOnv4KSzIPDNujh3+PKFl6A==
X-Gm-Gg: ASbGncvrk4xX3Q2JccocF9dScCYRW6itnWAnaX64oRR5hUPo15Bkq3bY5ROMauosuc8
	UZz90GG8LYtgHPYJxhY6yYPiePJN5vj1uOUu77Gf4k9mfHScCLYhi3I2TxtUNjIR7fJCqEeDZR+
	TxM46o7dPdHyzabwsvLBEBw+FYYs6tZ06tB5N6mFkdiO1OpIsMW08q3N/tfU2zp0cusHJChDOMv
	4MMQnQfdRl5Le/ee/5IkC5BXCtR19trM7zF7EaqHUqfMF1eYl4zzVA0/JoXT9FKQKpw7nSScgnu
	w2kindDyrmL1jZ2WySKioRmXh6ZjCtpd42S5ZXMaj6huaWOURliE0FY2+Ns=
X-Received: by 2002:a05:6214:460b:b0:742:1ea2:b5fa with SMTP id 6a1803df08f44-7421ea2bfc1mr87069536d6.27.1757351363924;
        Mon, 08 Sep 2025 10:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED5LQ1C1kD2cQaTdi6CchCpZ13f6Gj4BgYLX1Z0AMPVgl9HbDNtaLifWHhEKfT7Yq0Zl0NpQ==
X-Received: by 2002:a05:6214:460b:b0:742:1ea2:b5fa with SMTP id 6a1803df08f44-7421ea2bfc1mr87069046d6.27.1757351363366;
        Mon, 08 Sep 2025 10:09:23 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-721cf6d6cffsm119097426d6.54.2025.09.08.10.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:09:22 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:09:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: ti: convert from clk round_rate() to
 determine_rate()
Message-ID: <aL8NwHe00OeVuAuW@x1>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Aug 11, 2025 at 08:48:05AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops. The first two patches in this series
> drops the round_rate() function since a determine_rate() function is
> already implemented. The remaining patches convert the drivers using
> the Coccinelle semantic patch posted below. I did a few minor cosmetic
> cleanups of the code in a few cases.
> 
> I want to call out the changes to the dpll driver since a fair number
> of changes had to be done outside of Coccinelle. I unfortunately don't
> have this particular hardware on hand, so I was not able to test it.
> I broke the changes to this driver up into smaller chunks to make it
> easier to review.

I included this patch series in this PULL request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian

