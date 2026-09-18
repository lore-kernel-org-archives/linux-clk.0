Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9D33AC0ED
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 22:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770402; cv=none; b=RD+RxooVA2SkB3tzYtEdCe0GlyBGVhWGenoN9T2RgQp6G09ll/HOdZcuwrGGBI0P630921h9/vP9xGiTsvp6W2/hxjJW+QbTWikTttK7bRTC7lYOWy+IelB7GjodQTOt3+G/KXri2TQ1ZfXupM1BVxgg4Os0e8CMtiVAWGkQMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770402; c=relaxed/simple;
	bh=ssQhHGeC9tO3RO4j2WTE7N98K72AmrjyZhQkNSQGoI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NO1hQ/DKdbFgQ51ztVY690GuC30sgnjbcljxGqSgG22WIrMCIGW42Voqvu0S92TJ3N1RXB1atMsnelBBuEkfdM6TOS+CYAhDoTIIXvimM5QI9uTjUa4Bw06gAyB8yaDSlE0TcrnC0YPifNZiY2WxUnaMeZlX6tvXIrAbMg+Mpv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TMsrOhDS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t4mTscP3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TMsrOhDS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t4mTscP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bn3UAw1E3oH/r+kr+1llJ5QZAu1AtSHSGUOeakcpKao=;
	b=TMsrOhDSfUbQ+3wi1LJScQinO3KAgmzzDkBwN1N/6Dz5VEI+6NAJLwppllmYbzSr8xtHgD
	Gedvh0K3Ei9Jkl3oucC7B4SAEmsDhsl8ZAn5V05I2/JdDHO8M6DJ/qHIfYTgoiOpEzS3Yw
	MmEiH2XWSS+HThSgSKiBn8Gja49xnjo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-R8qUDpKpPQqwuG455qAaBA-1; Fri, 18 Sep 2026 18:26:36 -0400
X-MC-Unique: R8qUDpKpPQqwuG455qAaBA-1
X-Mimecast-MFC-AGG-ID: R8qUDpKpPQqwuG455qAaBA_1789770396
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a08ff8451so205729385a.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770396; x=1790375196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bn3UAw1E3oH/r+kr+1llJ5QZAu1AtSHSGUOeakcpKao=;
        b=t4mTscP3MdbQc743JPLjriXYCCyKD0sIiSgpRQB3J5HYpqBKV5qokvUYW2LrvuYpOu
         YhIjr3gnNKByV96Ujmv1cBMWahBmU5Z06peU7C9o/6KMzBZnCYolrPvy4r8kec61N5td
         OWOBCbxWqKrF3y/Lfs0ydlAEvgKdANTkbYmmMQ8Yic8ybQ+RQduvzvOKD0Gx6hZ0Dasy
         P0sWEShKZIOV2QAm4qDO0B59XO1VYTumiGQebgUN0eY0vt4MCTtQNamAvK/NKhQkp8rE
         BnaYwWMz3itFVuGZbJVKc0jOBbQWirKExIym9UM/QemFHZQMInqRCwrYfFenBWisdaxF
         +Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770396; x=1790375196;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bn3UAw1E3oH/r+kr+1llJ5QZAu1AtSHSGUOeakcpKao=;
        b=M2yvOldltU7ZFhoUYaBLuaEtwSmHhJqSaVS1nu48asBbOe+qVNKd/quTbbRNCYQZ9l
         0dpqpTpndH44oBKKmZsWjPlujbO2g/CFgSNu743lWIgaVAPM/R+sg/tT3fhb1kxsCOzE
         ra7fizIqLRYGky0LkUWImHsNGb2DmL9YYriCUD6AHAwsrW0jJLI63niHwp0LJFOyD6Eb
         bDW1ClYvdmo+GQEvn+iTO+n7G83SZOSGKgRR3KCSDMrX59jrxyxsiIIYxCoIQ0HlYkOd
         UVr64nQQnjTT8waP36pzkUFm+XZXwU9FvVTakEchhqPRUgR3JaG8B+pudDmG8SYbiQm3
         5dqA==
X-Gm-Message-State: AFuF++kQ/Ohs8FLD6crgAHpc6TPSh0JQaIK3QU+7gwAruVmFkaFVlvTQ
	921rQbMGivXn/WXmObJ5UnjNLp/7xzCM6VsGaabpV7UBUO1vDwTkaj1tvDcLjyC7Cm6SuFHymEm
	uRI9raiuR7uxqIyDT43NGOnbN8B+4DaOhmgpkssKFkhNLl2ythvcPcN0iLCcYkg==
X-Gm-Gg: AYBFou3poazx36X31sesElwFDafSazDfh5wiLFUi9Gdkx0RrGrjb199YHaVayL/J9DO
	p8jc+bQNNnTrlQFTdlwbEFsu8CUMwBbhErDj849QOK+K4lmVPtaUQSGqROjNm6mTLyIsTnOJpnR
	sdqhAY1zYu/eRqAorjdFdksaVFs12lQoU/QEB+V7cDVTeG4ViDR2/GU007txGfllEAOp+XyOrPL
	3wqiSLkf+wcQ8hBrJ81uaK3ZbzNzpG8RFVDTCCB++ewhzcUJ48U/VxkxWtO0A7cj58IV9C9/L+u
	OZ1EbV68o+A9hLEfWxjWIPPSBJiDIVX7MrAAp+hdjVgHOtT/k+Rtz8bUkHkHZ8Hhs9FJRL/Zp8u
	V2A==
X-Received: by 2002:a05:620a:170e:b0:93a:14c3:72c2 with SMTP id af79cd13be357-93bdc6c776amr655938685a.29.1789770395940;
        Fri, 18 Sep 2026 15:26:35 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:93a:14c3:72c2 with SMTP id af79cd13be357-93bdc6c776amr655934985a.29.1789770395469;
        Fri, 18 Sep 2026 15:26:35 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedaaf901sm51382785a.21.2026.09.18.15.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:26:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260512010938.41114-1-rosenp@gmail.com>
References: <20260512010938.41114-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: pistachio: Use flexible array for clock table
Message-Id: <178977034219.517928.11236545995612517796.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:25:42 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=303; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cWdJUy9XmOXzAOt8v0t0kJx78gmFNwn7dBPQ13b3708=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLW7poR1XGszqF45cf5/2Yf/mTffGsW03P9mQedS6+yv
 nzNfX/FmY5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAm4l7N8Fd27ZWgJ7Hz1pq+
 CXOY1FS1Nu7ENClxy5dSa577791W7CnOyNB1pZn1IctZM6lbfzxEX92d/vXsa1+V2j3PJ/Ef/Tq
 zOJsLAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Mon, 11 May 2026 18:09:38 -0700, Rosen Penev wrote:
> clk: pistachio: Use flexible array for clock table

Applied, thanks!

[1/1] clk: pistachio: Use flexible array for clock table
      commit: d27364c5db4f507cd9f3e7fb77c472fd69207256

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

