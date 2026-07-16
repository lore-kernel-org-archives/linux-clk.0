Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9FE433BC0
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212113; cv=none; b=WOBQCOneirc0kGzLnZ8IPSPoQgc7mWoR9XlA68wbO/AKBukHZQWhCahsG2J59YXFRvGyRBjSWNK7GFxd/AoCXvXiQaL9HW3xpQIAED0jY2ExXMM9+lwX5wH6x2O+CzU+MLYC6jZXme+aXqJgniAIonSjI7vwuxlUO7nLOQli6Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212113; c=relaxed/simple;
	bh=v4b0ZTgnxAsD0H0mNiHse56RRxYRA/rrx01zJiCttks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dr2RxFcpr3xx8wBBQdrtUFNcGQNkIMn6rI4rRhykybCukvKF0sTaKrEop6k0ZBtNP95MGNa4ZJbsn/QzxX9MoLlB+VqYOm+Hdshv9K0VSc/zbdq4GxJ+kcYUcVmCADwGMFXpO21G5l2S1HkbkZvK+oQwp1jmM/RNwpukemvS6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cOcSuJf1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZeE6CEEI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cOcSuJf1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZeE6CEEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784212110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zw+9uymcNzlxJKKy4FHGEVrfFsfp6TRSqHYePvcSjr4=;
	b=cOcSuJf1zTKMjY3IcOlXpB/h3pV8yWqKYl9hFCgtAQ11Oel6tPYCHZWnAVAxRwvslHKLro
	gnu9jpxIg7OzJ9NakEkYuOAFIOO307+l3OIOIWltdCqks5ZItg5AQkWuHC9/Wfc9BAQWZ/
	mqbqJQ7idpVq3H2XaYNgld+9nAjzGVM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-Ba9NkuZPNUWbJWyFmp2DPw-1; Thu, 16 Jul 2026 10:28:29 -0400
X-MC-Unique: Ba9NkuZPNUWbJWyFmp2DPw-1
X-Mimecast-MFC-AGG-ID: Ba9NkuZPNUWbJWyFmp2DPw_1784212108
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so122305281cf.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784212108; x=1784816908; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zw+9uymcNzlxJKKy4FHGEVrfFsfp6TRSqHYePvcSjr4=;
        b=ZeE6CEEIyyzAjngXVdbJF9rVd2nCVWd1yzVtlHe6A0Jr18wfP5aJ7tXMr1jrspBhX9
         DyjYhnwXRRSAE4E0Yo7x9t9S/va1AxEqIfWdGeV2QopIfx33kR04nXhV8lIeElZ1cncC
         hG4QHMThGBLm2fykOzRUC5AcboLE2YoRW7jtjX0VrA+NQKbO+XNfcANVNFqsx6uuGCuA
         ekiqb8SkDi3hbQv+WyRJpa3Suvzt8g1vABfeJnOHHYNY+/pCilHNp/g7kChkuaZIKj2y
         wrddg41xg6TEMh4iQrFTtEaYdCTsrgPK/0B9TwIaPaXW1BRCdfYGX4QcQRCtm+OPja2n
         anRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212108; x=1784816908;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw+9uymcNzlxJKKy4FHGEVrfFsfp6TRSqHYePvcSjr4=;
        b=rJO37Cj5ynuYwW77A6uFNPpdJCqpspcmSc8kTgGKIwgWClmct54YRjc6kYnuKX5/MZ
         n4X+k4+k6kknkxCO1lSxZ2jHA80QXXLqgTlg3boJmcbmWP6EUOgnxVmS+tYIzIT5iCq0
         /ct/vulZbTzEMDdSXhZDrQXoMyKd0kxKbxHSRP+puhLxC9CvmrGjnjCUJ/mE4YoCVymW
         HNNFUJ08Pr15dGs5RKtOUEcK8BCjoXdKBO2vMySePUUydxGNdFRZP7E8Sr7qwNJqZU80
         9vvYp26tCwXV8/Et93AuId1Vfzqi+r3tIKDg++M7JI6Vghobt3XULAqfqfSA2PVYQ8nO
         eaIA==
X-Forwarded-Encrypted: i=1; AHgh+RqH06jMcA41lPE/v6eg3/HFLyRixe0cOA+wb5Aa8u1ukZ+ymcfsuDYAuCs97bn1Ec2cfwaDPz9EzZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsRSR4mcz7HMmjb2L+gVzcHykzwaLaZIx9BVyK+JiOrxiZafLA
	nGrv4aDJg8/A5fYD7RF4BWyv/P+fLZ+AmspXEwSjr48xaMq7IhpQzPFADKGRohwlwndNiBNpbeo
	EGOEJyi0BJn9upnkEtoorTYz7oaC1SEyGmC+j7REy4YHGLv0BTGLpcj8FfE14vQ==
X-Gm-Gg: AfdE7clNFC//Bxu8AzD4+IaHF71BmFWWjvOiOdojABf+8c2Ecu3XEDqUTIvnjXtvb4N
	AqhJy5fqlz3bR7efFPf3akXPha6qCo0Jl9nuS1SDQQBxQrB+/p+97jmCQMDe6oS6Chr8KwhtDmG
	e1Eanw+Qytdlyzqm3v8B/PHNSS7s5hPrQNy5wFRwbXmWZWW6kWCdmMkaM3zjYX+tUm76uEbf2Kw
	tet8kGrMs6/EG6uE9gQgPrH1vHDEH2RZ0UDsPShVjFK6LaCfza9NhtrOlZTZY9UJ4Kp9yeT7+xS
	lzwI4zbxGoVOsEibVMJZcouy87qnDkBcXRGw3ycLxL0KnE/TUrliFYUvizJeCHBZYyvTVXI=
X-Received: by 2002:ac8:5a09:0:b0:51c:15c5:2be6 with SMTP id d75a77b69052e-51e3c1551d5mr134459121cf.8.1784212108133;
        Thu, 16 Jul 2026 07:28:28 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:51c:15c5:2be6 with SMTP id d75a77b69052e-51e3c1551d5mr134458541cf.8.1784212107530;
        Thu, 16 Jul 2026 07:28:27 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf671e2sm154835271cf.25.2026.07.16.07.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:28:26 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:28:25 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: duje@dujemihanovic.xyz, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mmp: pxa1908-apbc: Remove unneeded semicolon
Message-ID: <aljqiVLKvMztoQCM@redhat.com>
References: <20260714052525.3219644-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714052525.3219644-1-nichen@iscas.ac.cn>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 14, 2026 at 01:25:25PM +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

