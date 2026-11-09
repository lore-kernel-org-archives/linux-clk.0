Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234913;
	b=wX4280bi3bxWAKcAWIDTXs7vqIc8Ud1WoDG59j1XtbvPqPG77JJxOnVFyAIoDH68JH5C
	 sWj+UxGJArHwp4sN/NxAZ3sLv10mCyFrybm92X6uYVf8fIi2AkRFBGXSSZYMWGxNtvio5
	 lkqnntsWPcZ8fGkRt8KaOIBPO58eA7ZMiHqxL6JhuVSXV2iSNFu3wBir+Y+M+Ju6Ohoyg
	 xgg21TnY/MIcoKl3FFEK6NhmrfiayT4qFx8V5RiR3nbc/uOrt+hE3Qawd0lGbKOz1SM5o
	 LEYsnPdDtITqkwRi8lKt4df4qreh8V1xHGcsXiymJa+RE3pylOJNM9Zv/GFIKVC/1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
	b=IYuynUqWzCZxmRuw8H0Ay6EHgtyqzk58B8W61Os0eGc2yJbrfgziIARH4Zl1DnsUBXwU
	 n2wnoisYAHpq1G/XrRlEoHigQI4SWY2jVqVOjXsgrkQCH7oguIUzxYIyk5YKOydwY6nmN
	 JzfugFN4a2CbgLy3zxd7hvicDe2XQ4Kz5iPyevdRNBzu10zhhw2IPUStJ2erzRZY8EOtE
	 Vy6w82cafJC/R1YpoIMcCVBJnMCyJ1aCyzZ7GTTf3HclsmhI4EQjTHw4dZt7s9dfTGX96
	 KSxT2MZbckz2f2EDEBJxiFpcnskaP7rB7iLUqOnC19WOi10LA8P99fxiJr6G5nyuaMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fl9J0rG6;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E543606A330
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 14:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E543606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fl9J0rG6
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491aaed7565so582656f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794234911; x=1794839711; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
        b=fl9J0rG6Bg7w6suryqbCEWKAEjT35UiVoohizax4dxCos61JJrOz186cE+4YKDNPCe
         EKoSWVudpNYliAVwaxY5RRSTWveafHn3ZkFW9ca86XTu37KlkGnRT5+OVMmRSvDlu/e7
         1kFqVSIDtQOQ/1XfN6k7ZMn1jTblW6cmfLkvo5BbSQHJnyewfcPH5mKHrfxFDlKvHGJ/
         N53fOXvbQ9Am4oC5jIwUBmlWUJwbN1jIV/QZyQjZ+QJJUMro4n70c5HVMdBnZNjKK+pn
         QHgoNEHRWtrpbM2Y3taMgAck4AeQZ8k0R505OhM3BLPdj1tQl09L7SQmfnKR6lZGEBDf
         MBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234911; x=1794839711;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
        b=HHffv2A6AX4dpUTEm2+p/bOyGFSJOxtoWxNftB2mKJGc8uig0avjhLsS73/qiMLXyY
         YI0C7js5yA50DmX7tsNERNvi0wpwaBLEGf8ypca/p7mnqmJfAN/OFZ1WrRTiWmC8l7Tm
         M2hW5BeQ9s39vWQHT7JiXwEQxbkDjr3cDeDgssMIpZ5hR+HzCuAR8+b6uuRKNPKRRFGd
         yd32alTXi23YDwSjHNM2hIOL7CvbdWq50JPeuj1X9FMfEyWqK0F81zYXQV8g+tlSAEEm
         6dP+WIBOIPQSygfq+cxiVXR4AXWE+kCknMNlqiz/ec1sdHnVW89INcxfU33RBRAquIHJ
         UZKA==
X-Forwarded-Encrypted: i=1; AL+hErEaNoMvj/4onBBBRLqNDjZsfpQIH4ayrPUGXqiTibzbVosa4pLH6ToDqwlysqjauq6nOgBdbEYPG/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KCeE5sT/JSqSX8witCyUXfjn4P5LOBwmedOy2joK+jJdUDc+3
	5+sDkGIYz09VcJtHcO3kZTHZ/r5vezlSE/hVz8hb/CKwf6THaW8Lda2qdK9n8nACcsk=
X-Gm-Gg: AYBFou2UNe7zTrvZO2uStuO34UoGVXc2AeYb6JMt7kmNLpHCfp66L5x+DldGkS2NDJr
	B/f2+huBavSAFCPp5NlokQtHHOYbcAZwZpqD5hysmLQ+88GrmqtTVP+7aPKQY5786iXyvnlq6yG
	xOe3aFACJ7X0aNoKN2x0MpVzgSM7FL2/nZSWpJNOJQ9jlJK92Qr4LZii2aqXEVwXK+IdNq29G4s
	7BYw7zMyhsqbQ+VLW934TCFLsVG9086M3AdTaA9ynPZ/cph8bd28H/NhdeWfJMw/JlBX7QXpU6p
	FCCBs5X0MDLnZj5yYrMUeQtPRrz/bJjBgu+e2KqhhZQ1Vy7NxAuGqw2BgC2N141lFDEHl70O3OT
	UJZvAxtNvG9g4mF8b2PFIt+76JwTuI1K37QncPtev4qPLwm+Y1WtJQSjuo9qcUz9eLNh9v/VaVU
	2X3IbXFN6MLHNMTfO4H2QZNy3g7t7l2Sr0PUje/Q0mV+T9gZKMDxEKWhVAAvdExJYCOz/u35enI
	72Oozqxrr9BXSz2hkAOQPtrdmxYmsiG3OoAI58qR8kBt2InLSPzD66FFcdc3VaEnIQBnqgvgsTI
	q0QHqhZELjnVZq/E374yeBBymxKqZX/TY75SMSokLSWLMkxvjCAsmYJ/YveQZcTQ
X-Received: by 2002:a05:6000:26c8:b0:48f:bcbf:26fc with SMTP id ffacd0b85a97d-49584b5ac5bmr9070341f8f.53.1794234910753;
        Mon, 09 Nov 2026 06:35:10 -0800 (PST)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49596acf465sm11956132f8f.21.2026.11.09.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:35:10 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/4] clk: implement sync_state support
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Date: Mon, 09 Nov 2026 15:32:58 +0100
Message-Id: <179423477880.2972505.2645503913422176960.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=o4Xgpkdj9rBV0TT6F77aSGItRKN6wTWMv6prG5GBA7U=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBq8dmgv+aOX66nSDEDsF1k1CaSV+jhqW7LubaPd
 5rQ0zILw9SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCavHZoAAKCRArRkmdfjHU
 RbxyD/9BeZoYQ4glcyQ/Fg268/AgxasdvPsVvllWI3o5uLYKBhg3Z+qIak14twdrnOqq9R7S7hL
 +4XDMf1PIzcmSxB/1XQZHmhM/pB9eLrQ/zmcOBUpLfi1rSBbw0eC3FFNwrYhNM/bu4jdBOcMT/Z
 JApjWL8WuHRz3YvSMcKCsK7I8KBS+Jzx0Vp/wmy05oV8M25wMMk4k3EssKdyYG75DpuMPbT/8ko
 zI0i5oA0YnGoGMbQPti3J1ZyASFtVExnTtK10BvaNq7f8nUmmU4rcpaTFYXo3i8xhVhMkqfkDFR
 ReRNla5mwL3nQCFr+FhvtVLZYjG7zQ9MyN5WAmDzsCwNPuWP0MeE09fiVLiA8PR1qc802csWyDw
 4OUZ937h+jK86x4qGRJOPyx20Euu7W+3Afbuxr9fI/izX5vMKRE2WGIoiAkEptjzoOtW0CzkdYn
 +YjD8x3Ej/Q+gb/qWDeKfLGvIWlMtRjgPhYg5DyQwAzBwixzZiLRtvSLQoMo/z2w/SOdAP/5K32
 2gq6DA0l5znKFTpiFZTZ8ivE1wmFhka3+NtPV1deahwLmTwVPwDl+g6Jbdyk74vNSWJdSz16JIU
 h5RO23/M7pKwh/LDwcCoGLxcld6EFLxNx71D97haH/yuJjw9T3i0GmurktbnjEAJeTEMVe9daJf
 cbYC6Hvp8QrPY9Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> This series fixes this by adding support for sync_state to the clk
> subsystem.

Hi Brian,

Tested on an MT8196 board with the GPU enabled: with the series, the
MFG PLLs are swept once their consumer has probed, which let me drop
two local workarounds (mfg_eb marked critical and a parent enable in
the unprepare sweep).

Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
