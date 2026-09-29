Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA8F50277E
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701545; cv=none; b=Kpu1dDN4LCpnLPrCOoSCB682ZEEUgtUUVKC/f4KQvbI8NqEXuXma5HOZIYg0cqtpAQd5odYJsyvIo6ZPeVJ+w43HJ+3emKDPjtwj6C5FxfLybX+DFoBzbQ9N6+hIofLnrTOQtjzdTtzibmjScITwFNjgkYyFdnt4hiqtT5iNcoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701545; c=relaxed/simple;
	bh=JV8h3XKKL4iKc1z0q0ZRCkZ4gT3Y6S4Dns2ilEa3XNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VlwSKJX2zusWx1D518YkaGUAMkaf9pFcBWJCX2eBoSTn9NfSiO74jm+L2sOgPgjveSk3okLsYVnyjY6GVdY7EJm0rGWmJcO0uclqvYWJ9PkjEg6ZdBrO6sKxwM14O4atNlF0kSdLSDKKpTv6+Wmj8VYkcvGhuJFAUvZ1z0ZOjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VKdzLDDj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JSwYylKP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VKdzLDDj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JSwYylKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790701543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
	b=VKdzLDDj2MHjWsBiEiq8z/7jeh2VziesCrbAQ6IxgCInnYIVI1JBQ0eZcD2O2I+b6lXkJQ
	aH72jra+bfvxPE7oa1CUTdo5bGwpjvXSsDxvZ/opYGBHs245IL1Z9g1IWXMVdHijJ74SQx
	Vx7A8fHz4KeBsdVX6q+C4yz5V5nNtoE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-jOwu_OaNMZOODnQng2Fk8g-1; Tue, 29 Sep 2026 13:05:41 -0400
X-MC-Unique: jOwu_OaNMZOODnQng2Fk8g-1
X-Mimecast-MFC-AGG-ID: jOwu_OaNMZOODnQng2Fk8g_1790701540
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so198529085a.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790701540; x=1791306340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
        b=JSwYylKP4AVGNASKjga98weuxW6sBvD7ogU5r9U3Uxa+f4WR7q8enhZDxtRD3gCd/3
         YQk8AmZF1oDPA7WgZNy9bLmSN3HIRP/maXNgK18zrrsy4wT59vYPzfG+qxOE5SVrNlF8
         Pn/yGDyoHj2CIoNFqaZ247pCoxXQIgj65+I5yPcGpY0gUX846GRJ5llDj21WFfbfLT8r
         PCHlB/5i9bfntQ2Zywr9AMik+qVPj0GPtp5xjiih8bqVr+uq11g5gF7nqAjVRpHur5vu
         X0r5Wty9euy67r7lptrrL4vjKAcv7iKNu1vddWs6Aa+/UfL3GTLd2DaZig/uvhqulzJz
         sR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701540; x=1791306340;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
        b=Q3CaF7f2fiU2Lm+klfy5ZNDa0PEuDkCZGwQNYdR9/BeRnzysyRlF8wEiKUEx/KSz1O
         hGzBDb7XEW/gLkJAkxzMo9sR9d1oki2pN9cQDaPHFU7LydgG09K7vHjc7SBlteMqEZ1A
         ycEUI/ivpcqzAXuj8UIE1fAuUefD/K0BrmuIBDkrLOX6XwEzECkSHxgAPVQqBeY+WHvi
         Qyliw84Do2XqQCI7k/VOcTlmwQhfw5bGnTg2LXeoWpMhx2LAsB3E5CBFZ8t2mbKpBMJv
         RdTX0v2CGWMcMCyT8fe3h+FyqLDpLlqKPRPwxKAeV+xNjYB+fl4qQH4eE0XxSRAk3T6A
         ayYQ==
X-Gm-Message-State: AFuF++lW/M3OEPxjjJBbwA/802/uqAgBwSzGbHRkeeNzNZF/zDpIP1+Z
	9AXGMLb/gNg0Y9G1cEwCAPWt/7BLtMQEFIN9kVsTdz0z7qMASjGxN0vLtFGIK8qFYDAqkfp7sVu
	VWq/DQp+SLvr3BDWQZHmUf2oenqWq1pWcAi86fcEY5zeZJvT/g1LENu3jD8Ou8g==
X-Gm-Gg: AYBFou3wUysukVYn9UvSbMA0lzUOoMHoxfT/V4Wa3dRu0KdRa9rAlpGZT12AyOry9cJ
	LwtAZ1FxRAilsafBtbr+4gBUw1KyRvLKtraB9w8tPu/LBM7IQlmJaBgEaMfU2ao5O6p99n/imCd
	LmD1yJ1/O2vOOOY07elQgIt0yVyoo2KXmxZk2GsY6i/9QxJnTruVh5FmCvaXHgHTnPZrik3k2t6
	Q1fHwqhpT3fEmC/7bh8n+41rojg92UUoHnwgEnZ2eZ+DA19cyjSTxLW38+hNVFrUTrIIqsU0YIO
	TpSWDjyjX4gFt1A1HtmtEYE0rmdK+qXOv6QqRtqqplf0nR/A10kufC/EncKupAFIRL1nlXWYiE3
	k8EmnLRzbVd3DYpYW/WGxGXRiIowp7p812KQn75uWZZ30N4yl8ik=
X-Received: by 2002:a05:620a:6988:b0:939:7e23:b2f2 with SMTP id af79cd13be357-93c9fa5fc59mr25256985a.25.1790701540249;
        Tue, 29 Sep 2026 10:05:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6988:b0:939:7e23:b2f2 with SMTP id af79cd13be357-93c9fa5fc59mr25248485a.25.1790701539617;
        Tue, 29 Sep 2026 10:05:39 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f541cfasm14451085a.38.2026.09.29.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:05:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260719214349.734351-1-rosenp@gmail.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Message-Id: <179070151857.199845.8103237122518687447.b4-ty@b4>
Date: Tue, 29 Sep 2026 13:05:18 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=273; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oS1ZL6IKxW4hwmHG7GbpdJ7kavjzT5ERg1L4wiG0veU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v39wNLTMfKFGZMxiweX9O+933NBfv1/6+p+T/DNtz
 EW3HmRw6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAi220YGQ4tX3Py89/Ee1N+
 vs88PJ9ZKPPO+wfFNtIVaaacdV5vVpczMqw+96OJZcb/Txn7FTd4np/zIujURX8e388xaxe3XFl
 2fgY7AA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 19 Jul 2026 14:43:49 -0700, Rosen Penev wrote:
> clk: mmp: allow COMPILE_TEST builds

Applied, thanks!

[1/1] clk: mmp: allow COMPILE_TEST builds
      commit: d0b72c88671b3c46342bbebc9b90280890436c98

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

