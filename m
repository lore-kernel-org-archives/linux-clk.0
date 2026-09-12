Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A344BEE3C
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173053; cv=none; b=YZnXrsMVLbPVhtT0mvrmRTd9C7834Tr4xlFB/F3Kf2r9UX4tpDP9R0lRN2czaxappdeM0bLgtAO+9n55TZAXBH0L/5MC+FYdwv+B34kx7+SiSVfhhfhBu4Itul5qPM8PjwSbaQa5zLJ3KRa+COk5NqFhXYpjbfr4v9OK3jd3nn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173053; c=relaxed/simple;
	bh=vKZbfu339lBD3I+7owcC+zyR9DvZk2xDRM1VnbxoUD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m87WeWsRTkKjZ5eJQTYB6GDHnT9+7umFCTOdKgmFyhhtzBrFxuldC/LEmwWl8ML2o92iFN2PfMKt61dbl2nknQuviOQO2nfOzJNe15eig+jkofWw8wfFrKAvjzbOIbM8ZbK+ULN1jNwrgkxmbtlSLn7aXltHb3iGF/SxjrMSMrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOdifYIa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4o65T/R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOdifYIa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4o65T/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789173050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
	b=QOdifYIa1Og9dht/Z0MIuMrCJVgtIaEG+HkT2sDWMNB0148iZEipIuMlpptyZ+dzL6At7/
	DeiYtMjZxzHC9hbHYRzy9gII/y5mcKCFK7ISUoeInAnWvfdcdn01LRTai69RZb60XZqslI
	e/QpO4cQTyO7mrXOgtzNkz6H6GSd0kc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-i5OeeelrOi-BsjZmH7reoQ-1; Fri, 11 Sep 2026 20:30:49 -0400
X-MC-Unique: i5OeeelrOi-BsjZmH7reoQ-1
X-Mimecast-MFC-AGG-ID: i5OeeelrOi-BsjZmH7reoQ_1789173048
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104eedb5b0so25845036d6.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789173048; x=1789777848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
        b=i4o65T/RtU5DP+tcswUc3L6f4//7r+U7/+Zo0F3ddDYvbmG8JFCqst08Bs05uBZWGV
         ucb3acHiRMX2RyMhe+SHy9Ei7FWFoJfGGKHzIgEV3odtf42u+ZO5sKgeiZYQ2SnvPD4s
         teCXPbS9XV0+O+53jcONbwENXbS49RQyvs9YvQ1gTOrBFIjju2qZYA93ZHIEbJOTPcNk
         ZUkKCoyxrFtzU8XAQYFP0Q/DCuGymsYX4FuKHSNbQZ8OBAGjJVnMwhjf+J3DdsPd7U7z
         DWpaj60sGOuHy9WCk9tOSIIMXnZLfh7zo/UjgJt1/mlusQUBTriIB08jamOHZ7Nk7qgS
         O28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789173048; x=1789777848;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
        b=SaKvLSLnPk1swj2/bkigQXkd+Qa/0HucC/iiVlaS62J54oWn0e8TK9jFkm11/sOC3V
         PE7VMaodMviEFLE+3SF4qeAK921lvlp4qA0RGK3ljp/8Bveko50A2kQt6pOm9qlGZEvd
         L1LgqeQMqgNq1zzyfHw9KWOjLwrPu1ITvo4Cs++d5WDXj1tXpFFvUdziTnJXovKNNdUl
         UpZ/4Y+ucMFvMhiRjAiVeMMR1/npxwS1CVAXQN/us9w1vGtqS9s6mrSsib1fWWup/zTW
         6L9u6meoGUh30wkRwzWlMU/4n5Wuej7KsgjSFGHbJUgd3qfYxe0np2VHBWrzufdMtSOM
         eVhA==
X-Forwarded-Encrypted: i=1; AKwUvBwcaKyyDuK2/iSIOYPm11A7GUPw3+jLXLFg9O285mh/NY2UmlV4LKIa0/6taUx1ohJr8jnpdbyTyVc=@vger.kernel.org
X-Gm-Message-State: AFuF++kOlPs6MjepbfwjN/HXvta39hbMvSJk0jiGtTgO0EINRQ0wL+o4
	+J+GzWty0mHnyv96YNC/cOwlcYD/b2Rm5iDmKYwobjKOxEwEA1sSk0Pc1/v9vcqkt81Bm3Dxh63
	3fIhcEWrI4AwMv90sEaY6hib5hQM9shb23Nu3ZS20g/QG3VLK0ebyV2pNQO5Isw==
X-Gm-Gg: AYBFou0rLCkYgx0B3D9wkuu9ABIZtW8A23sSHKUnvas8ITlhhhdAhmnW0GKnHVJIWCE
	A1/MLNHKGiPdZxiQqLkQv2GhKlwPuY88Li1VlY4lh1s1qjESxA3Isww/brFj8e6CPM2HHfOStOg
	pxbQlxuhZK+K7pdk9aO5e7Ytv9s66pqDH3SvrUMWdPPHotW+tUHac03+thoB+NFT0rK8t4KXaN+
	WsuIonSoD55WBdyj+foOIDQ1XhVYusk7K3oPng1kwtgRAnJdBefZ4Al+11jt13t+2jJkjcF5fdi
	wvQooZzgfb+yPHgxfU28oPJQGHks+AqRUS/H0bTzWCC0sscF26hlU7Ps5XnxB+lwTWqBfHCeCKq
	2tl9/1+6HFwqAppcPyxPVTC5fRd9LTGGkt+tJruta
X-Received: by 2002:a05:6214:f6e:b0:910:3fe4:e767 with SMTP id 6a1803df08f44-912120e27fcmr90307666d6.25.1789173048405;
        Fri, 11 Sep 2026 17:30:48 -0700 (PDT)
X-Received: by 2002:a05:6214:f6e:b0:910:3fe4:e767 with SMTP id 6a1803df08f44-912120e27fcmr90307096d6.25.1789173047878;
        Fri, 11 Sep 2026 17:30:47 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d51f4sm32995096d6.46.2026.09.11.17.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:30:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Pengpeng Hou <hppiscas@163.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti <andi@etezian.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906033651.84082-1-hppiscas@163.com>
References: <20260906033651.84082-1-hppiscas@163.com>
Subject: Re: [PATCH] clk: s2mps11: Propagate OF provider registration
 failures
Message-Id: <178917297065.837981.2231676629415391817.b4-ty@b4>
Date: Fri, 11 Sep 2026 20:29:30 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=318; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cvd5XU2Bw/KJUcvrIFJB31t8tTRfednBzdTJ7JCC5hs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWzDURVt1mW3yjumDLygmbfldOmyzUbt85xyBSICGmz
 Gfd6R9XO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgIyzpGhmlPCyZOv9PVaLG0
 m6mmMfbPI/Fbxl/+l7UsP7bp447U3OMM/3O3zl15LoHNoMDB1Z5rfl4oU+nUSwz2QpOtSzgMkq9
 78wAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 11:36:04 +0800, Pengpeng Hou wrote:
> clk: s2mps11: Propagate OF provider registration failures

Applied, thanks!

[1/1] clk: s2mps11: Propagate OF provider registration failures
      commit: 276741aac3b56ba50bef59715ba18ba3f0b953a2

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

