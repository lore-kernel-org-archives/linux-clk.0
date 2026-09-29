Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC2351FCD1
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 17:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702041; cv=none; b=mMJkSUnbpUppXz+m770frxakgkwQk5g/jz8s7kdZxPQowFG/1QW8N3MQkMYkvN39U6TQV/h8nkaGvSV3RWh7pmNSoY2JfDyCKI/8Y4qLtRzXdFJPSth/c372fnm1Zb91ok9QaqSI455gIU3iUQCb1oAgNFLvexQbncKRsAo+ziA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702041; c=relaxed/simple;
	bh=VPZj7kr9gHB3FwhI+2ZFN/POZDkm9HRFS8/Ru/rNotQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dDdCtw559TYmlqMqzbk78DqWUJ37jydtgrc9umkje19XU/PUQtZRqWvF2nGuTQWaid9LJ+I8yjdhPuXDCyeFuvQFLCv7nbyHMoi7pKpIDLoJHD+8cOoqcd4YbfzIL57vwVNeqYvsR3XogJ1E4jsRFUKDvRlxwU2HDtfup+6RvCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1IMLpdD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BnObrI82; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1IMLpdD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BnObrI82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790702038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3HOGLeK7DPs4Uoyow7bfGzTo+R8F/Q0t/X17pZ0Blk=;
	b=d1IMLpdDVG95tqofDyN2J6VcIyJBEbgFvlHFLdsgYQN7z0Qe20agF2PIFwNJnqgaAhFPRx
	MFrHiFuk/jj7AnGKlU+6zmXv70OM6TBP2eanK8JJG3h1oGMO+Tu153yygDhm1cP2ct6v3d
	X84FfKTVMJOCzzmto4pSKsruhKHN+Uk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-YF7Gh0AhNRyXDrjio-qANQ-1; Tue, 29 Sep 2026 13:13:57 -0400
X-MC-Unique: YF7Gh0AhNRyXDrjio-qANQ-1
X-Mimecast-MFC-AGG-ID: YF7Gh0AhNRyXDrjio-qANQ_1790702037
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9143d796129so79688746d6.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790702037; x=1791306837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3HOGLeK7DPs4Uoyow7bfGzTo+R8F/Q0t/X17pZ0Blk=;
        b=BnObrI8277p4mh+37nBdpA0Hewfe6EvOQe3ZuaGd8QNP+6poL310PZSM3B0nYnE4Nd
         sAcs5ayf88g0AVdJyWzH1hqelY3WZfpghKNGDuqlQgLIRgeVDSBdLRC9RwwReXkvrny+
         CoAMPHlwYmowLmS4bnz6dxacBQ5jfHMWNogj9LQ0H5HxQeJhFNtnolZGPVK8fnxpyqpq
         +3pMvWR1mtuvw364lIrAu/vz0dl6K54nfdZV3qPyNDhhfeW3URSDDINJndiilxCcifMJ
         dAVnT44Bz5nVuQHES0bRM154MDyj9PPLkKM/zeF19xLT7MzJH8LxVm5MoM4KKre5LL4e
         FcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702037; x=1791306837;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3HOGLeK7DPs4Uoyow7bfGzTo+R8F/Q0t/X17pZ0Blk=;
        b=JgGgZIXvneUIaUuHhKi2+ARLF1Rm4kPaVxkErsm+QQpvHb5ExVK0dVbjPLnZP++FZj
         gOl5TwRwJEHIK+HMxfnh3uqI3aeKXc9iwPpANzT9S5K6W51+QXe1a96Hzr7R9zZNH3/X
         mddEPntS14WhfhCmkRRs6BslTGDGvvdpNydR3u5t0rQLNo1DVv7LSt4juJmduNhlkScy
         mhcGrOE/ZfXlhdP0dTCBwqnfNaQtUjK4iWPEjDUrsea/N+uKvuR+18HaftRkObsr/Bhm
         lUm/ZFpB0SJUWFjEHnyqa21ufT0HcRWRolDaWSi7IqU3XcbL0+by48c3qxvMRKIJDBVG
         tCrA==
X-Forwarded-Encrypted: i=1; AKwUvBzzzXWHmlCvpQHmCODkNMxlJZBgC1L24SSEsDB2B0scK/t7tKd2NfcGFtAd6ZV5pOhYiszHKEd+4hk=@vger.kernel.org
X-Gm-Message-State: AFuF++nmZl/7rtm9FUWu0QipyRtwkdAoN6OMATs3NHDUwgaNOo0/81O3
	YUhmNTrd03ar7InKAqjCSH/WsuH729vDU8Vs+8DwXDa/922Hvbr70m3B/vTseaILIGS8ScOz/xa
	J3EkJ9fwMPYwU3rkLmq2ZaxyQKkPWFljF+Ia61YqDl84Gk1g5a3Xks+ERg5reIX6r7mSzcQ==
X-Gm-Gg: AYBFou14atda5ERZufEng1egXxRIwO+AGFQWV9ohOc3yb8+rmRikK+qbYdxa200bsBN
	7Jcfm1P6+NCcJ9XTcRbhOt2BcVNJ0xoSYka5md8D9ZpFEHOXGlXntL9hGsqZDNfI5jaDLuuJLLP
	pqfYtkrSIQ+37LpSmCagS48OwnokhZa2sjmzW+uzASstBhxCPRKE3tp7X9AFObhFz2I6niyJIJq
	0VYopE83K8/5/neahVCFHqRbeOXYitjVuWiJd3z3AtysSODvXDt06rZ/fPCFHoOtXHD60OCpR+n
	mVhTgRMk8mOZr9akpXvsX+7H+cXrxHtmKyvpOjFngraM3iL6qMccn346etkPUv+lB/29wJ9lowv
	UleEDrToMSHTrtZae1UXhlCYomOg4oxLzgwIq0f1ozZ6JMQK0NbA=
X-Received: by 2002:a05:622a:e343:10b0:533:290c:642b with SMTP id d75a77b69052e-533290c886emr151965411cf.13.1790702036820;
        Tue, 29 Sep 2026 10:13:56 -0700 (PDT)
X-Received: by 2002:a05:622a:e343:10b0:533:290c:642b with SMTP id d75a77b69052e-533290c886emr151965161cf.13.1790702036370;
        Tue, 29 Sep 2026 10:13:56 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53369c038b6sm3451cf.25.2026.09.29.10.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:13:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, Pengpeng Hou <hppiscas@163.com>
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mturquette@baylibre.com, s.hauer@pengutronix.de
In-Reply-To: <20260920034124.15700-1-hppiscas@163.com>
References: <20260920034124.15700-1-hppiscas@163.com>
Subject: Re: [PATCH v2] clk: si5351: fail prepare when PLL reset times out
Message-Id: <179070202964.199845.17628699480491234980.b4-ty@b4>
Date: Tue, 29 Sep 2026 13:13:49 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=304; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=aRL3zJkbQmdjhJGBcYFcwWocOTDPkNk7SYGlKZZInGI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2f7z4X2BS1oSDLIu6utznP+h7dKqT2+dEqF7xz7QuZ
 /07fGeEOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhITT0jww3+xyoc0n35E7iF
 q36tMOaf8rBX+Fv/IQORIzVaN1dP6GVkePJk60+BbS1HmY6a/s1NDSo4LnHfeLad0UK/c56yx0L
 uMgEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 20 Sep 2026 11:41:24 +0800, Pengpeng Hou wrote:
> clk: si5351: fail prepare when PLL reset times out

Applied, thanks!

[1/1] clk: si5351: fail prepare when PLL reset times out
      commit: b6685c30d15cd7f28c40b2daaeacc00f21b2f12a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

