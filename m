Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133FA93A
	for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 01:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715649313; cv=none; b=IGb4RY6n5X5mSzJQ5zLk/vZI0hXG1iRfMfITrN+JKDrh5AVuvW8o49HBkW4qem57c3/b/pStwC7hjTbFN1mgtjoEGmurlN+RVzzPNOrk+AdS5L3QmamU7c8XwMDPRukGZAbcsG5co86xhweE1YNPwe2bAiLKLa2Ntkiz8XTMQd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715649313; c=relaxed/simple;
	bh=X9rJ4eIhwGwFYhM+y7NgLIstnavfTfEL8P5zFiG8V4g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=egS7a6GhcngVE3oSDdh1ZTmYy83XTX1V3eVG5DaajoIEmj3nqWzZrqwOGObg7/QSbV7WG3oVHXCppwCfINXX1EhZ8MpY9529yKdCVtM9+zWNMA9z+2rjCThj97O8AjW690jMSn+uzy4sCLdSjCX+3WhBDiNqGLNi2AN6fpACnC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8A8b7xH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8A8b7xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715649310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=VaTSK7maH96cyUOzuTwcGlk4eMVZqUirsxqVchpZK9M=;
	b=B8A8b7xHq1y9+SRWldz3hVnsvZgzISFeh+tJus4b6saQb4LiW334+05oGZVxVPVkfyj2Nm
	lf3h5tFRSicbP0tiFm5KkWki3MBH9IJExKLSfk7zc/XwU5HlhRUzkKENV2GgpLyt2HCoy8
	dC0x7uTSCgcTFYpQIO1aDWWHgq89pb8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-iiUdy8-8PHWWazPjfTfyUQ-1; Mon, 13 May 2024 21:09:07 -0400
X-MC-Unique: iiUdy8-8PHWWazPjfTfyUQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-61be4601434so101242167b3.3
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2024 18:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715648946; x=1716253746;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VaTSK7maH96cyUOzuTwcGlk4eMVZqUirsxqVchpZK9M=;
        b=iSBvf4/cX/xMoF+utjVVeqvdX9Yer1ZTSSqaREufI/fc9uXn3i33KlWb3F4AIDjL4U
         Fn06tAk1IbBkluvfEr2HLZGvK50mr1twfafuRaE9o3INbDdf21ya404Dm3r+mmh+KsuW
         sjDwKEXNr+3CvA5Uz/l7bzu/eC+isrbGtONLESt1bDaALo/lsmZw7ZDy2E/xY7JSGo9Z
         9T1ada2+HsflnfqkBE2ljLsAYZf4YZbh3t7TwUodZW4BXL6cLqdQPKdupBMeCrmcpFQ/
         z2w3CLiilq2RG8445iuOuTRGJTSfW7dafrlt2M+36Y8a88o0YZFsSiXaD0OyJt7rre4/
         bxIw==
X-Forwarded-Encrypted: i=1; AJvYcCV3x8PLADDQ+Zhj5oznTIzlfOe+5OUb6ALQ6hIDrVXp2SQtgGjnB+h5hwR9PSFimjxW50wZQeBrEdoxol/wYDN40rbizpyWKpnO
X-Gm-Message-State: AOJu0YzJIQlSENj+/e0rBQSnhufPtJjaeU5ftbKAthCYV4bkxAP/YMtX
	+nG8qPfIsAsJfjmdk5X7D+OgSWaXeXwf6Rf6GLtQDqY3Bvlu3YAHoLciZ+12dgb7Qf52Ba4P9I8
	MdJP/KpnpuzEGa84SQ2opcul7V4lEc4UIPbEnIXuHgR3Dqi9ir5NyJHa5xMs3z/h6+/VvJVa0sY
	H+q+icv2VarsMS91QQDTNelHjM3vvBINkI
X-Received: by 2002:a0d:d451:0:b0:620:5182:4790 with SMTP id 00721157ae682-622b014c2a8mr107151327b3.42.1715648946327;
        Mon, 13 May 2024 18:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIbySwX9BuiEfufQfGqT/Lujt0vSbeE8LkDxNI7EvRLBfkQBIJ3POQ/KzPw64K1QwAyWSEDsc6jUWCFosi75E=
X-Received: by 2002:a0d:d451:0:b0:620:5182:4790 with SMTP id
 00721157ae682-622b014c2a8mr107151237b3.42.1715648946005; Mon, 13 May 2024
 18:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nico Pache <npache@redhat.com>
Date: Mon, 13 May 2024 19:08:40 -0600
Message-ID: <CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com>
Subject: [Bug Report] Multiple S390x KUNIT clk failures
To: KUnit Development <kunit-dev@googlegroups.com>, linux-clk@vger.kernel.org, sboyd@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Audra Mitchell <aubaker@redhat.com>, 
	Donald Zickus <dzickus@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

We are seeing a number of the CLK kunit tests failing on S390x. This
has been occurring for some time now (as early as v6.1). We run these
tests as modules (without the UML wrappers), and have not seen these
failures on any other architectures.

The failing tests are:

clk-gate-hiword-test
------------------------------
    # clk_gate_test_hiword_enable: EXPECTATION FAILED at
drivers/clk/clk-gate_test.c:322
    Expected enable_val == (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))), but
        enable_val == 33554944 (0x2000200)
        (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))) == 0 (0x0)
    not ok 1 clk_gate_test_hiword_enable
    # clk_gate_test_hiword_disable: ASSERTION FAILED at
drivers/clk/clk-gate_test.c:339
    Expected enable_val == (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))), but
        enable_val == 33554944 (0x2000200)
        (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))) == 0 (0x0)
    not ok 2 clk_gate_test_hiword_disable


clk-gate-invert-test
------------------------------
# clk_gate_test_invert_enable: EXPECTATION FAILED at
drivers/clk/clk-gate_test.c:249
    Expected enable_val == (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))), but
        enable_val == 0 (0x0)
        (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))) == 32768 (0x8000)
    # clk_gate_test_invert_enable: EXPECTATION FAILED at
drivers/clk/clk-gate_test.c:250
    Expected clk_hw_is_enabled(hw) to be true, but is false
    not ok 1 clk_gate_test_invert_enable
    # clk_gate_test_invert_disable: ASSERTION FAILED at
drivers/clk/clk-gate_test.c:266
    Expected enable_val == (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))), but
        enable_val == 0 (0x0)
        (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))) == 32768 (0x8000)
    not ok 2 clk_gate_test_invert_disable


clk-gate-is_enabled-test
------------------------------
    ok 1 clk_gate_test_is_enabled
    # clk_gate_test_is_disabled: ASSERTION FAILED at
drivers/clk/clk-gate_test.c:409
    Expected clk_hw_is_enabled(hw) to be false, but is true
    not ok 2 clk_gate_test_is_disabled
    # clk_gate_test_is_enabled_inverted: ASSERTION FAILED at
drivers/clk/clk-gate_test.c:423
    Expected hw is not error, but is: -17
    not ok 3 clk_gate_test_is_enabled_inverted
    # clk_gate_test_is_disabled_inverted: ASSERTION FAILED at
drivers/clk/clk-gate_test.c:438
    Expected hw is not error, but is: -17
    not ok 4 clk_gate_test_is_disabled_inverted


clk-gate-test
------------------------------
    ok 1 clk_gate_test_parent_rate
    # clk_gate_test_enable: EXPECTATION FAILED at
drivers/clk/clk-gate_test.c:169
    Expected enable_val == (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))), but
        enable_val == 32 (0x20)
        (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))) == 0 (0x0)
    not ok 2 clk_gate_test_enable
    # clk_gate_test_disable: ASSERTION FAILED at drivers/clk/clk-gate_test.c:186
    Expected enable_val == (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))), but
        enable_val == 32 (0x20)
        (__u32)__builtin_bswap32((__u32)((
__u32)(__le32)(ctx->fake_reg))) == 0 (0x0)
    not ok 3 clk_gate_test_disable

