Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7FC334368
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 19:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764964017; cv=none; b=bjJFlHe7xCz1TtIfthMUo52kbbFEuMyLLCGBsxyCp7D//lzq2q5UZ++VekxDJMe8+LrdN7iY/P/f2V1bkypiK5TbgX0kyfW8O4oAzbryhEQC3CYs+c1qUwERFhHzf1V23kcAslNgctFtDHiG7wZlCdF2ERSd0PsHBZU7osXkH7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764964017; c=relaxed/simple;
	bh=gtIs+PR6UbJDClojL+R4O3oXAPHfTqBt+4nRF134ciA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gj6jffZWSYe4wtu6Q0049ZwL1UJBYT5533lNa9tbk9gApK79+xBX5YAS5BJsoy+tryTSapmYRMPvfe26qmVkPmZcdCwGR2RPXKsb2i31OeFxMhUBaJP8s+NS0V94ChxUir55F/rv9Z6pVhM7ke7P6BVyTbk/bnVmOpBDM9IiPR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KBXnwiB8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iX46LfX+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KBXnwiB8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iX46LfX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764964015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/LIFKf063d8yHzNm0uamjenhd6Ijw4cyeXSS0veBq0=;
	b=KBXnwiB8+Yw6rbddhbq0l1vI5o9czuv0ViIUEy7zy6Fr30QSEL75vFRESnu1gCvgVoepgq
	94F9iAc8V4KQeHbpqkcO0B5Ku6spWFfo3t4q8ajUkdFijXOzVwojX3mNx2TlrjDDnxASjE
	SA1i/58vPA8/2mX3wvWNK7OCsCRuf1k=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-_7ziozt4PkS6p1ZThl_zbA-1; Fri, 05 Dec 2025 14:46:54 -0500
X-MC-Unique: _7ziozt4PkS6p1ZThl_zbA-1
X-Mimecast-MFC-AGG-ID: _7ziozt4PkS6p1ZThl_zbA_1764964013
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-787f7261b62so49899257b3.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 11:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764964013; x=1765568813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/LIFKf063d8yHzNm0uamjenhd6Ijw4cyeXSS0veBq0=;
        b=iX46LfX+DJJiClekhftEsxQx7opmlT2Dhd94Dp9Il52AsDwtswFJn7k7+Br1hCP5KB
         bU1J31TuSg+Xd0H3c0N7bO7ehAIA3IJPeiTmkZIY7Unt3eoifFKHRXf1Qrzl9rGLGU+z
         EG2lQF0ZX5auDAkIOLGj+Eq6f3ZzfkVldxvFm0+YLQm6LEnSYS1mGg5YjjnlRT+83Dyh
         zBxNyN9fk2oNxgkvvs6zGfc72iaFFeMuKYtlzxE+QEZGD09hiyVvfF5Dewt4vHwKN422
         VQWt1PThj5XzotrckpexSerUK/uiS7eJplUmlxkqRNwUfuIAajT9FxKOTgD8Rp2vvLUS
         bfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764964013; x=1765568813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/LIFKf063d8yHzNm0uamjenhd6Ijw4cyeXSS0veBq0=;
        b=kKxdgqniMYOx+t9YrHC7yw17skYUBGK4vWkeURYMY1utvDeMD+pCk5B4lh4UJ3iJcH
         5xoXnMgg1Gj4xNsYJXVuSRoNSAnaCSbEHHOWrDSQcv7lIpmXvz4P2NRN18wqW+h8zfw5
         NW7hNgVYp8+aauINSgYFQJe4AjZLtbe+gdHMRwf8NttRgWsPisnnx31CCnR7paFBaAFR
         gHAXjwRrpy0bAJ/oYXUKa51D8th58pKUbYMqHgP5VVKf3HjK+nMuUm8fshmlDkUnXtU3
         2lshvU7clmVW1kBB5FIHJcDyAGq8ZlhBMhusMRElDnV8T9cyc6peqAn1LupdkBGtx3ky
         fnJQ==
X-Gm-Message-State: AOJu0YxJzzJbA+Ufz9lg7JHqo9S2ROIFmNS3dgRzSMzMNEKauhzPtaZO
	KCT12otPiOMKHBfDiLfF1rtSD2TkUgngT+p0ITqGYfynqJeh6jZq8kE38//xKSAeefYIQhA8hMA
	O2FSFY2hMK8qycMPG6WCtnFVoolQTaxzLsQe4WbGq9SxMOuHkVHevP22/H3AQWw==
X-Gm-Gg: ASbGncvBPRyP/EVL0XGHbGcQMvFxZ/3TArfuxniJBJi9rbPFIcp+kcBYSYzpehyzm5/
	6NMLzEg7OOONjLZguXfHFAB8Tx0xD6soNIeQd12HBTkrFJzxE7DXWy2x65L0Xav6H9mECYk1T+n
	RWC+wb+XneTj/llGiK66fQBNKtFbad4LZDeahIsaLIaNmBnjrIgRKJTvml0qCVM0/ywI6io0Jcq
	JvE3A7OZkaWxQF/64q27CeDm3ITvWGjQpFptA0ZAvcDO8fY9+P1KQw5DwmBb7sBPYtpQQaAFB1O
	pbmkFvh/4STZAGpka3mctoMslu2Gqo2kr6o95EJgjN51D/DH0t0qF1AUAE4n/a+i3OoUZeAUaJR
	xqdWs9kwKv1MHFTZyJ4MSLzgwAm05pSXxeoi15CbbDHGM9N7n
X-Received: by 2002:a05:690e:e8c:b0:640:dcd7:3559 with SMTP id 956f58d0204a3-6443d6f10f3mr5658101d50.12.1764964013336;
        Fri, 05 Dec 2025 11:46:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVhwkAjzFhnPyQio5oDm0owjJfqZu2F2EWU+zJpVLLPJDk+85YZ1y/IC5+tqCX2kYOxA7klQ==
X-Received: by 2002:a05:690e:e8c:b0:640:dcd7:3559 with SMTP id 956f58d0204a3-6443d6f10f3mr5658077d50.12.1764964012868;
        Fri, 05 Dec 2025 11:46:52 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6443f2b80casm2151181d50.9.2025.12.05.11.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 11:46:51 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 05 Dec 2025 14:46:29 -0500
Subject: [PATCH v3 3/4] clk: microchip: core: remove unused include
 asm/traps.h
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-clk-microchip-fixes-v3-3-a02190705e47@redhat.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
In-Reply-To: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=gtIs+PR6UbJDClojL+R4O3oXAPHfTqBt+4nRF134ciA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKNzZZotcSHCQUVeOQ5XTt2WnvD8dXed77Pt+f887i6x
 kTsbOeSjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbSP4GR4cmf1ZLJ1+fW+t5O
 yJ+3rqHlxt/CIhvLD2Hvz85p9uOZfJ2RoSHApEL8zul3kSKrp+343OcqeWONlfnM9d9SJ7+ok+3
 dzAIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The asm/traps.h include file is not actually used, so let's go ahead and
remove it.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 82f62731fc0ed566b0c6b007381c4f10a2a8a7e7..f467d7bc28c87a50fb18dc527574f973c4b7e615 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -10,7 +10,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <asm/mach-pic32/pic32.h>
-#include <asm/traps.h>
 
 #include "clk-core.h"
 

-- 
2.52.0

