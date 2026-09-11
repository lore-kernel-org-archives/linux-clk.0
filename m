Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B73CAE93
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 23:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169298; cv=none; b=fw9yBuUsZltcAohScHhY19XNxgxO16VTdqfmwNJDl7+fuUoS5ufTeOhcXHZfuoyuF3x62OF1mZJrL5C01b1BweDIhZL22nkvUvuVuShwothh1glFisJDUMOfGRq9ekR7dQCIogL66hEXAfwkgcXJbGzIsUOgpg2c+J2+AFTPNWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169298; c=relaxed/simple;
	bh=cAmpt/6jzmjRUtzY27yTb1f0xUXpTa3pQOSlnGJ3bqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EVljlhpD72lyN7z1Afj+3W8KzJsyaUK3JowVLvlnmxB1d/tqgpIJExjbYH2RetEj6WjEmTtMCQ8uCk9t7nlerxbBtLL4/luNz4CzE/HhlK7PFBI7imityk8hLyF1Fa1tCe2e+v1Mns5ulduZhLcgNYKBTqT27gPjoCRx+yNUJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9T+oBRE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLV/97o+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9T+oBRE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLV/97o+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789169296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNhLBr9XvtyJLawhPkiUDEcwIc+PqdjYCsGMWqH0ovQ=;
	b=Q9T+oBREjiNg3+ISxSrItVoJoJcDAGwRQEe8nhWsuDuNeZmVYiWeXUd0s75vEZv9Po6C3w
	iOku1sFCkLKGb8ad9HJuNFmJkWEkj5Qgs8ykdBrWsG+tz9TYAQFvO8PQEryZA2lBTe8jkp
	1XxNh6WmhumP2fHkaV8rc3C5RZTjMPs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-wJdFAZJ0NkqOs8NgzFzAKw-1; Fri, 11 Sep 2026 19:28:15 -0400
X-MC-Unique: wJdFAZJ0NkqOs8NgzFzAKw-1
X-Mimecast-MFC-AGG-ID: wJdFAZJ0NkqOs8NgzFzAKw_1789169294
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e98e74535so25109346d6.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789169294; x=1789774094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNhLBr9XvtyJLawhPkiUDEcwIc+PqdjYCsGMWqH0ovQ=;
        b=PLV/97o+l510LfhJPbIHKy1rZQsyvMbJ+rJkp+npacdsZqgJWJlaF9z12TKBu48KLt
         wIEX/JQNw/7n4J6GHpyjVmR4V5Uy5wMwl/mhjKygIjp+aOmd/wev9Is9qO2zCXhoWZtX
         B+bZrw+baZrqd6dAQsy8tNc8AYnaqnzJB4GKw3sjcsrUAyBSn/fz4nHOPfRn+p6aR5Kr
         27R0sXb6w3bemvwunv8b5n5dTfnSFL5Mqai/Iws8aeDGueJn+0ydI5qqQ5wnpTzbFLsA
         kM84E9gt3Qj7PYX3RyUOJy8NJc6Nl2uPiX2F8KjAs9uIPVIWOg8OiA0nK5YJzLtfUDWy
         MSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169294; x=1789774094;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNhLBr9XvtyJLawhPkiUDEcwIc+PqdjYCsGMWqH0ovQ=;
        b=Heyv5xHm+zwz+u9W5tDhCeJ82G16C9ZAfOKie4EuNbZFz+ykxzxNGO8/je6YqMoM1C
         +axGRLGcigRszd3ss4m8WoBYx+0TI0m130AA/lvwli+fPTq3KDoGunec0COVCjRdCetG
         eqMW3gahte/ayFmeAnkuh3/1H8y31t9mj5PGHI8S8O3FyxqveKm2BuAmSVXdmb8c/Oe9
         7azxw1dZ1gNFbbprlnlxORrfnEzeYMTDG4/RjCL+yfrzfinU1WojW01/Hg3qmwMvbZSa
         euEooyKxhr4JpsnrwfsMmfK11IQj8bQyAk86akw0+JMbOA7KstfPyvveFVqRxcpERhWk
         4IRw==
X-Forwarded-Encrypted: i=1; AKwUvBxmFL8fjWpP/Bhhup1E8uD3VsK//HSE2AYkdKTzSP/8IRh2ZgRh4o9AIGLivhcg3bFSzCCDV3zTiFk=@vger.kernel.org
X-Gm-Message-State: AFuF++lAqg8Cbmv7AFGDEbeQbJws9+bmMvPgpjrDujPKZKZ33yOYCVq6
	82yIQf7jljAO0aNGN/pXdO9DQh+qN4Zz/jZH5IkTakdhhLHwhY9b/OEfxQy7tMX3Vy8irZJXWeL
	OEWERpOH7CMQ59xFMkSvi+ffSESXvQMEyh8hJb5Qc3J2nkk9mS9agAccqjoLPWA==
X-Gm-Gg: AYBFou3CoMk/vjN/Bzz/TurJw1bqhFnRca63y52ltDyShirw3YBFYD4K5Db/p05ugVq
	rfzUqNIqukxba9DSOGW9Hy2+WZOhOB8jf5dmXXa7VcJIv01yLPdWuL8OPXJo0VvvFgKNEdc7YzS
	r2AIWxH3MAcLN2BTwqYetVG1Vfz+BjJjUW088EFN2oQnS5fBpFF8UGtOKTuDxwlF5ac2u/xdg2c
	EF5zVjfMAncv8WPrcX52RKNYv8jpIxy6FUamqJ/QSvCBcPvY8YdQa3jy5M/M/WYDAdWbPUP+avd
	ETGYKm+Amj5gRGULKTbE3NUadFsrQl9CWa0Gbib2UkhcHkrnX4glKbd7fCfMNqPM50CXVHJP9Ia
	IuuNHuGGvgOTNi9orHMPTwa4GNLg/gobPHYDqq24P
X-Received: by 2002:a05:6214:252b:b0:910:7010:7a0c with SMTP id 6a1803df08f44-912120dc08emr102710926d6.21.1789169294422;
        Fri, 11 Sep 2026 16:28:14 -0700 (PDT)
X-Received: by 2002:a05:6214:252b:b0:910:7010:7a0c with SMTP id 6a1803df08f44-912120dc08emr102710506d6.21.1789169293928;
        Fri, 11 Sep 2026 16:28:13 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3779sm32038926d6.43.2026.09.11.16.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:28:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20260904110959.21527-1-hemanth.selam@gmail.com>
References: <20260904110959.21527-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] clk: tegra: fix typos in comments
Message-Id: <178916928469.770750.10487153336129404917.b4-ty@b4>
Date: Fri, 11 Sep 2026 19:28:04 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=271; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=n9nn2Er0cB1X2W39yCFnXtqUqoO3GH14NXe4f7iwsZA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKW9HWJyK190vqmKi70/AKH7xdqrjP6FIVqZRX7znGfp
 rrutP7rjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZio8XwV+L69l9xqzJO/Vn2
 /v/bFT2RDXf6b3+f1X1UI1fJMkSa0YThn1owz5b1Fq+aY8+Vd+Ze4Tr1VnfVvWWbel44dbXebrB
 mZAUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 04 Sep 2026 16:39:57 +0530, Hemanth Selam wrote:
> clk: tegra: fix typos in comments

Applied, thanks!

[1/1] clk: tegra: fix typos in comments
      commit: ad0252c5615a47d2c97de84bbc2570d25bbd0512

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

