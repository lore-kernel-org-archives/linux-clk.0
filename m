Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD4399340
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857613; cv=none; b=Kfh1grgjvrwkaQ0Ea8mYb+OPyHVJgKRJ3PJKErWN5nhTi+Ea0aQjRRx5vVVwqz5uCnhD7Z34cyJ/Omkc+Q0OdKtK1HPCCDLtGGECT5RCy7CP7JQDCm2wTpYus9hN9GcHZkbhyDoUw7dk2AE1LE/p70wLJH+Wy0l4ULxJmieVaEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857613; c=relaxed/simple;
	bh=UDeWptvLj0b5oSam43dNy/seViN/UvQzaOuFKDvdmhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GaUHo7sgU8HXEx87gdcvtJ7na8ypkS30aNCfv6Tpf+blsrmECnVM5ukp3v0zQC3NiTHOXGD5LMjXlPOI+41RUnjh+02GFbVkd7Z48yigoht4ID2CF1vG3lc9ZZ8IvsJr5MIzLntOIhLYXz13EIbb1B7hgylwWfNRwPDthXBOpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MkhOuIXY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OsIU74sl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MkhOuIXY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OsIU74sl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785857611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4FpnrsdM+ZF4fQJSgsYt1ARWgH+W05xcYTVu+nMglOU=;
	b=MkhOuIXYQ3WHZN3TL6WjLi8/hetJXx9IKTgfrekRFi+u69SAOnE1/vR0++E+rEui2eqSh/
	cv3e0j5tmYu7Jr6oNhlYOvEFtWwKspf1BNMNz7JPLyiWslgaQUzzdgzx9/qzu1GyJ75DAB
	UZqNALQPGTuW7UGonV9VVoqsqnXTeck=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-Kl52CkCOMZClncgII7xEHA-1; Tue, 04 Aug 2026 11:33:24 -0400
X-MC-Unique: Kl52CkCOMZClncgII7xEHA-1
X-Mimecast-MFC-AGG-ID: Kl52CkCOMZClncgII7xEHA_1785857604
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7fe835353acso72040077b3.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785857604; x=1786462404; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4FpnrsdM+ZF4fQJSgsYt1ARWgH+W05xcYTVu+nMglOU=;
        b=OsIU74slFACzuQ16x9wNd8l6MCsDLJrzArBm5tJOEBn5xULnQ302jJxPeJ8wibfel+
         iExxgq06rlnoT1V6P9GxUQBWL32S1NbTHVHvHo8lO7ZTKQxSKwRUmrjsykgikobF2qQH
         Jz4x5h7hxPw+qHciFIDiuZRtsL1mhV8PAMCijjj4aLtPXMP/fXebPh4TK0sRTuiAUDKw
         7fN9iEYV5w8BhuXbXualvYB4Gnetoxk8YK00IIpu+ywOG9qae3TLB5S1xCZ0CjNafi2i
         ezpJ9BlVKGXRIwbCQSXtx1z9721pVA8rvBzYpzUqSdZNRUsIjMQvZIlQ7eNCEEj/V6kx
         UhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857604; x=1786462404;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4FpnrsdM+ZF4fQJSgsYt1ARWgH+W05xcYTVu+nMglOU=;
        b=bZ+jle20LigcIOFH9eP0bQvsuJDIo5PtRSZJZIFBw3JHAkl8cJRxfOY2CD48XR+n+5
         uK8B7yan1QNPlwj4+FeYV5PV7tk5cVJ8pk+raaG8X0wMRFpG2kLqFOK5dH94FxPMQXCh
         xqcKmNfkVHHzOzvY1/tc0wwwofNA8xvGRTQFa7rAGo9Qd8OuhMMIP67YWdnyNm6qe+Xr
         4wCvRiTpFfx0oBOtBz90/rjsbBuDT9QjGqw4D9tAM9fGwvu0pivJMBkegK8ZKsFnHc5Q
         WVl+VKjS2t1CZ+sZ0/j0mD5cSzbDiy7BLA2TYMfCcauGBMBtMSPrCz/tV85GxYhAvfvN
         flCQ==
X-Gm-Message-State: AOJu0YyAOyGoj9dY3GMelpGvsecpGDUp33XqytIdj/h2TwhiY2rnswNb
	HOQUEPEqHEtXnHhVZst1MaKyJaobylxPYGIjOpNuu2sJiWn+Aflj+wUmmJkxwwUWAs+lBwjleCM
	Ds15UxMslEcX/O+qYIRyZEmog7Lia/g52/FjXA9pVaHwwXDEgu9frOmeVY4kS5w==
X-Gm-Gg: AR+sD12bvJdXyHgjZSGh9AqAcqOm1ymsa6WCwn4ptUSKY3++elEH31a4PiWPm64w07P
	PbxYQxFBX0EUqEtyXynmJzRmV+/dNdTl9E/Wxc0b6+Qscd4lcYvCH7SylJsNQgFGbCTzZD1IFfu
	/2LuH4whQwEXyTQlq79pqSLzXwXK+vTx6gmXpBh5yGur+Sk7vJUMmEDQIT2iZEmDsfSOdAUxWXR
	F94k0w4+y6N9a0AioEFdbaxvMvtmjA/ob/6i6aonKLoDLMgvLEirro7dqK5WOtnh98cg1tM4nJZ
	zjBUhQyXMYOQKf13rsoCzJclxoma5SPYKQZzqHoX6gFUBnx0XZOC0csGI40jZSsRZe0hUfRgssh
	hKuwfe7qMDw0+xjK5z1rNOWlG/c6MFIOTaT7LArM=
X-Received: by 2002:a05:690c:6b11:b0:80c:3848:bde5 with SMTP id 00721157ae682-81fd4a22e3emr188911187b3.13.1785857604125;
        Tue, 04 Aug 2026 08:33:24 -0700 (PDT)
X-Received: by 2002:a05:690c:6b11:b0:80c:3848:bde5 with SMTP id 00721157ae682-81fd4a22e3emr188910687b3.13.1785857603475;
        Tue, 04 Aug 2026 08:33:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm7414657b3.12.2026.08.04.08.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:33:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 04 Aug 2026 11:32:59 -0400
Subject: [PATCH] MAINTAINERS: Add myself as co-maintainer for clk subsystem
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-clk-masney-maintainer-v1-1-de593189a9a1@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMT3eScbN3cxOK81EoglZlXAsSpRbrmSSbGJpaJBmkGBiZKQL0FRal
 pmRVgc6Nja2sBppaBC2cAAAA=
X-Change-ID: 20260804-clk-masney-maintainer-7b4349a0f004
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=UDeWptvLj0b5oSam43dNy/seViN/UvQzaOuFKDvdmhs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKK2CyL5qYIreU57P9O8VXq0x/bWFVlIjauePN6FV9dB
 Oc138OcHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyE/SQjw5Svimx2x71vn2Va
 vDHpQ4GOdvnUD5Vx0nOeJyTafuy/qsrI0LiwZsfFqHUf7gqcuKhW9iB0Sa9kx36Pb9P3PnNgCtU
 9yQoA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

With Michael Turquette stepping down as a clk co-maintainer, this
subsystem is big enough that it needs multiple people to keep the
clk community healthy. I've already been doing a lot of work to
help with clk maintenance, so let's make it official in the MAINTAINERS
file.

I slightly changed my email address to help with email filtering on my
side.

Link: https://lore.kernel.org/linux-clk/?q=f%3Abmasney%40redhat.com
Link: https://lore.kernel.org/linux-clk/20260729121640.3864006-2-ukleinek@kernel.org/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Note: I made this depend on
https://lore.kernel.org/linux-clk/20260729121640.3864006-2-ukleinek@kernel.org/
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 07ffdec1c8c7..b9b01a3b70a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6448,7 +6448,7 @@ F:	include/uapi/linux/comedi.h
 
 COMMON CLK FRAMEWORK
 M:	Stephen Boyd <sboyd@kernel.org>
-R:	Brian Masney <bmasney@redhat.com>
+M:	Brian Masney <bmasney+clk@redhat.com>
 L:	linux-clk@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/linux-clk/list/

---
base-commit: 83adfb8e0c0e26f451564779c90798d1d4c13347
change-id: 20260804-clk-masney-maintainer-7b4349a0f004

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

