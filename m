Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47691586C1
	for <linux-clk@vger.kernel.org>; Tue,  9 Apr 2024 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712694926; cv=none; b=jTYy3IVr3t0D8Dz61Rxhyxnm4/3NNlozFadYgo1Aue2a96VyPg748rl0JLCyphXl5m0g3N69sbKh+5+vA8IP4qz/F3CW4OtlUrTYGDLcflduoA9wH7T6TY+6FcStwYCOiVUhNS8+dbjXoMmghG2OdAEIFn8Wbzz5yXoHKAMf4Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712694926; c=relaxed/simple;
	bh=fZIg5v37kdpa59dSYgf0jUUNlNvt5/x5mDHHcsopdy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WALJNviRErldhLUVVwkGNaJ8TzyW8AWdzIMhoAkZAcAIfykAHj/E9ADBOMatwPIrvacd5Ch5QpirgXiCOPS0QCmx5TfPj6g0qT/a2r2O2evdjZvfjpXGF6UL68DWLu6uFLP+zrkdlvGEwovxwCNBJDletLQfh2Zp3FH+4Nv2BbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1GXL1JG9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1GXL1JG9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e42a6158d5so11895ad.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Apr 2024 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712694923; x=1713299723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sbzjIXGi8MY3xAo287kFRCnEJlxM2VAYg6QbjiGNyVw=;
        b=1GXL1JG9il10PRtnmWEJLy5yDYGGY6Uxuosvozq1CtR7hCoEgUSFRP25meTsDcfh/T
         twrazkt22lAR3rGT1pFLOApdSlN074hnGRTabcOA/9DI88SN0IYh7aDCnj6G2H44914G
         pYgvWaLJ2QbGZN5VVdq1CsOwgVtZKt915peJodlfQ1xU40p5hokE9lkt5p0rf9/BkmBr
         6EZqP3LDcPpXm6KHTUqgn2qLwuoCAG2jwCSz6qtdlkS9h/AQwnsdQwVyiq7Ub4OkR97J
         iunFgSm5I3vm4Nb3lVbVpsbIS5sGkspZkYVwH8BRng6udCb3bi9o1USqYpYNvRWZW28o
         B6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712694923; x=1713299723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbzjIXGi8MY3xAo287kFRCnEJlxM2VAYg6QbjiGNyVw=;
        b=f9m9hhw/2NJb6Ddj90GNreU1wmziZOxINrZxRYIwVtWv8DSeAMd6OabZPZNHGLHOqK
         wJpUsEwSN2j1sLH4wSJ+W8pajMBtyvRbFD1tAQ5DVxd1o03w31aDA289+5Ceykfk+l80
         g5FnkJOg+OM9QA4qPtE4HPVomL3o4g6msJly4LspkyA+ozVZPQCa7V0cPNMUHBqCFfNo
         KEzOZgMPo2STx5bQ8A87cNxSQEgEerh9SATvToquXywPcQjwBsysNbtlqP2/KPJpa27b
         8DRSyc83kw/Y2C5nYLJG+iQujBN38FygwKaE4ft9TWKldML9cYhu9NzcikWaAP+xYEb4
         WN/w==
X-Forwarded-Encrypted: i=1; AJvYcCXqlTYMZvCRW+VbBDdxd+rzMaQN7y7+7/6pppDbza6seW13QviS1fJ1OxFV9tQLlYxvvBEkIoLdAjRGLHLNdelW7uZikNSIkmKB
X-Gm-Message-State: AOJu0Yxk2fEJSIb387TbvkT5p1Ai2+9mt67Hiv6opDD6+5QXO2kgINtH
	X8QaXb8yFSrv+mp/slm+ULJo6ZNQepSsSn/mb47RPMRNmJgnLiqLWwnWgYUIaQ==
X-Google-Smtp-Source: AGHT+IFbAgqRaIQQnQohL03A2IR6pwfXasIyq+0yEDQ6FgLyJnqBCuWghjNFqobOCKa2d0RR48njlA==
X-Received: by 2002:a17:902:9a87:b0:1e4:32ec:7679 with SMTP id w7-20020a1709029a8700b001e432ec7679mr2786plp.19.1712694922933;
        Tue, 09 Apr 2024 13:35:22 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001e424ccf438sm4564732plx.97.2024.04.09.13.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 13:35:22 -0700 (PDT)
Date: Tue, 9 Apr 2024 13:35:19 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
	bvanassche@acm.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	chanho61.park@samsung.com, ebiggers@kernel.org,
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, saravanak@google.com
Subject: Re: [PATCH 15/17] scsi: ufs: host: ufs-exynos: add some pa_dbg_
 register offsets into drvdata
Message-ID: <ZhWmh1NUmj2h02Ua@google.com>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-16-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404122559.898930-16-peter.griffin@linaro.org>

On 04/04/2024, Peter Griffin wrote:
> This allows these registers to be at different offsets or not
> exist at all on some SoCs variants.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

I tested this patch series on a Pixel 6 device. I was able to successfully
mount two of the Android ext4 partitions -- efs and metadata.

  root@google-gs:~# mount | grep /dev/sda
  /dev/sda5 on /mnt/efs type ext4 (rw,relatime)
  /dev/sda8 on /mnt/metadata type ext4 (rw,relatime)

Regards,
Will
