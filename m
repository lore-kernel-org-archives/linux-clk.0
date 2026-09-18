Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8E31AF2D
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 22:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770840; cv=none; b=J8dDjTWEJW07XfYWjPVhdqMrQIXrJkvC9CwFCda1xbV7VwHsfpPAUrozDyKJVkMFhkdkIDd0SBqU5XEucadQr9IkoJQ91rW5Ay/TCVMGefO5gd/F/eKIH445QK5H/xa9TgCmUpIzwT2JrOGVkBaocWCqDrhhjxuvTMjoFGmQNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770840; c=relaxed/simple;
	bh=INJqXLOzCeVe+xylhlZPh25QRwnRX/J/LaqLgwxpFIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GD2ZN8Z5XcwZggbdMN3GC3g7KLrNyfI1NW20tyQ4kwhOcDBQWS+OtKL8SJbYWg48I9ogsfiqjFlTRIPG2yXq4t9TR+6NvZsV7oxY8/XewMzq76JEe3lQv/4wxwwRllJG/E8XqjMFOYePc61gkk/rb52rnW6acaY2En5ESeeSsgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CKWTpMf9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VO+e7i2d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CKWTpMf9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VO+e7i2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uWIbl+NqjxFa+j1OOuPSWG4PAJNtr1JvOBX6u6e7mMM=;
	b=CKWTpMf9T6ZwsHG+tNby2ba7BqgxB/a2KzY7tM73i9ykv3T5F6HfQtd4sNWhsRvAdapspL
	OsZT24Q/ohIc7wpIG0cUZlY0HoddlsEm4h/9GLtnh4KvlYlX+WB8P2DkkNzzhzPlBrnTo8
	w3zdXnS9oQ/4FNPjlZyGeX7+oX3XyUs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-rUNLR4PvP3-uJVEG13ER2w-1; Fri, 18 Sep 2026 18:33:57 -0400
X-MC-Unique: rUNLR4PvP3-uJVEG13ER2w-1
X-Mimecast-MFC-AGG-ID: rUNLR4PvP3-uJVEG13ER2w_1789770836
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0312937eso173316985a.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770836; x=1790375636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWIbl+NqjxFa+j1OOuPSWG4PAJNtr1JvOBX6u6e7mMM=;
        b=VO+e7i2dDcD0IRR8HXqvTLfMt7K4Tldm5TnfmIrdVIJ5seLj5Hyot6KUJkPuDiEU7R
         usTUTIhmo0NE1s6tQYy4H/jb7Lg3nbjXaZShLrlSKlv9qNXm7ydrBCR9ySbxjFabpj6g
         LlvbbDukS/hdqy7Yv8B61xhc+h11vFzGeDjvZSaboz7FPn0gqv4o482c4kMlEOA2LNfX
         x3T9ZFyF3A5q0WggXK/vbJUl0ah8+JdvjOJ8pCzvMN7oARUd6T0a/f0Cim75cEC0xLWt
         FzR/dDhZQnR9xtoQs00iP55JEbtoDSRDZccKMcUn3xeu9qbDi98Ey+Z4s1e2lj4Rz19A
         fhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770836; x=1790375636;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWIbl+NqjxFa+j1OOuPSWG4PAJNtr1JvOBX6u6e7mMM=;
        b=IKT/60JXuwjmB+DMOor7qcpwQq0FC7qXDRKSXOsZD7ybTKoYm81j7+9uFyJhRYKXFd
         b0wly+2mD9tdQGWrLds++dtOwrIUsrwsd5/+3Nojkg1mG5WqyC/juPZmZFwzzb4cGy7n
         L+aBKPRNEXhcuqxvLCVm4AKnykoA0Dan6DDcHQgQDhCVvV7OdpzGzKyYQ7ZLepUPLvdw
         rFS8Gk2b5LH38UfF1+uMsG42lBieWy2jpWhXvAIQnkA0Q6ZWzkrJvYXgwO6RUNtZoDbA
         7ilm5YxZjWJ6bIbrf4LBE79Ax20Y7IJjIA6qNGF5JM7ON9erCPPpWhAgMAL9o1hwtnkg
         73Og==
X-Gm-Message-State: AFuF++k/CdXvm4d+OOQJkpk+qtnQo3AJ1mFkGXOB96qjZHkL5lIqMpWj
	lkvDmK3n4zL2koZjwy2qiHcn94KaAooIko5y/+qksGwqY9v9cJmfHyD0/I7dxwbZpzeTp1UzrxJ
	3xhTeIPnQ6lQvwHv8XO51xlEp3akDjYM92I7c1PrUcxIkIJWj+g/42CCD2Efxaw==
X-Gm-Gg: AYBFou247RH6gGsROyRJvZy70R1v/IbeU1j04kNtZPaDPGYzqEZlCClTuIQZRpEAUc6
	SNy1reHFD040TJQr++RSg1T5/lPpz1ba2WgiGHPdZse5kM6YMuUZMi73EwPKeC6YVDlRJpUE5Ay
	d5A3M7wRsu1OoQ2te/SmhLa8SnuuZn2he4Hp4yrcY/aMPaUwwCdzs00K2va1Cegc8vVSsbXF8y1
	+263f9KY8QRpia4D2Vd3P0sQ3ta25DHNIfn4LKIvbLNZW+ChCGduDrv/hDRviLxpJ7kYdaKp09G
	KZYn5Q0JynuBrt7aJuRmcZtA6cjdl7zDjMc7Ev8pzSOORlOlIWP57qV9Rwb20gDU0k0cUohF744
	zGw==
X-Received: by 2002:a05:620a:390b:b0:93b:d7a2:dd30 with SMTP id af79cd13be357-93bdca2f41amr674808685a.64.1789770836626;
        Fri, 18 Sep 2026 15:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:390b:b0:93b:d7a2:dd30 with SMTP id af79cd13be357-93bdca2f41amr674805385a.64.1789770836227;
        Fri, 18 Sep 2026 15:33:56 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bed720979sm52774585a.3.2026.09.18.15.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:33:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: kernel@esmil.dk, hal.feng@starfivetech.com, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 Slavin Liu <bolin.liu@seu.edu.cn>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260913125112.109755-1-bolin.liu@seu.edu.cn>
References: <20260913125112.109755-1-bolin.liu@seu.edu.cn>
Subject: Re: [PATCH] clk: starfive: jh7110: reject oscillator lookup errors
Message-Id: <178977081281.517928.6939892827902684127.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:33:32 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=310; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7EWeT8I/x8N3qDmNa8W41HSYuVGHBmJDoXqc4/tpGtc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLW7gl49870YOHjnHN7/7EFnen6kH5k9WGpQ743LOWvu
 ZhUX6mc21HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBERGsZ/ruceyawPvO93BNN
 7U2B+o4xTK/4jOW4FfazFz0y8sh4xsnIcOrrpiPrXsaq/5/9uyXg6Enb9bkSj9aY3Yh12nm1ZoX
 PbUYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 13 Sep 2026 20:51:12 +0800, Slavin Liu wrote:
> clk: starfive: jh7110: reject oscillator lookup errors

Applied, thanks!

[1/1] clk: starfive: jh7110: reject oscillator lookup errors
      commit: 54d0b6903921d121fa750546f2b38cc3f5c7e64f

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

