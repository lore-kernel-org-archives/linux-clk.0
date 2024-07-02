Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9CF15DBAE
	for <linux-clk@vger.kernel.org>; Tue,  2 Jul 2024 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719924953; cv=none; b=KZViqneig7pNe/Ojt5Nbhf6u2JOaQCp2SHlt+/x1M8AD3AnZrKD0HEeACegDSo/fkCDGgMkOgpwKELEvqmbZb8Lug0rFKrwyD0GfVGsUEfY8no+cdhHWIIbwOoBkjmeGXMBop+/VY931VkPbg25J96LOFgJj1THW515spfEUaTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719924953; c=relaxed/simple;
	bh=U6P7eVCzJoZzuJy/y8BdW7LZwuVI4OUl7YOCmqw2RZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fxKwKexXbIAZNh6EtEa03+tHO7FZX+MVkWRBlTlfHnV1+s9jir+PpdW2jV3Kstq0Tc3sqrRxnOyDT5a/UMg9Kt9CSrnSFbTHpl9bOZ4r4H40NNFkwm09eNAgXQDLO2X1df9YUlO7r+mowjKsm0cJSD+bSwEBOJKNQ0kcjlF/kHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lwdao0MK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lwdao0MK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719924951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EkI6WIyKHOIUgF7Gkeaz7pP1bO8F3B8gLjy573v/fkE=;
	b=Lwdao0MKdF4nhyT7I+oPJGZeqkcOCigOAqt8p+mZ0LZpwSnn4BQsNqX2AnHDQffZ0R/Hfx
	o6dP39pLZ1XGq2ZovX6NObdXTDrOIMfozFyfj6wW42zeA8Ym4RBPyJq6MlijSgGcBkzJwb
	oMy7QQ0IHY7GxGUMWeXyRBswz4LzMz4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-kD7lF_IfMSiA8WIKJOk85w-1; Tue,
 02 Jul 2024 08:55:49 -0400
X-MC-Unique: kD7lF_IfMSiA8WIKJOk85w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C906B1944D1D;
	Tue,  2 Jul 2024 12:55:47 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.34.168])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 240143000B5E;
	Tue,  2 Jul 2024 12:55:46 +0000 (UTC)
From: Audra Mitchell <audra@redhat.com>
To: kunit-dev@googlegroups.com
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	npache@redhat.com,
	raquini@redhat.com
Subject: [PATCH] Disable Clk-gate_tests for s390
Date: Tue,  2 Jul 2024 08:55:39 -0400
Message-ID: <20240702125539.524489-1-audra@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Currently clk-gate tests for s390 fail as the tests create a pretend
clk-gate and use a "fake_reg" to emulate the expected behavior of the
clk_gate->reg. I added some debug statements to the driver and noticed
that the reg changes after initialization to -1, which is coming from
an error coming from zpci_load(). This is likely because the test is
using fake iomem and the s390 architecture likely isn't designed to
handle that. Turn off the clk-gate tests for s390 for now as there is
no clear work around for this problem as discussed in upstream
conversation [1].

[1] https://lore.kernel.org/all/301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org/T/#t

Signed-off-by: Audra Mitchell <audra@redhat.com>
---
 drivers/clk/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3e9099504fad..3c3e0b969020 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -514,6 +514,7 @@ config CLK_KUNIT_TEST
 config CLK_GATE_KUNIT_TEST
 	tristate "Basic gate type Kunit test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
+	depends on !S390
 	default KUNIT_ALL_TESTS
 	help
 	  Kunit test for the basic clk gate type.
-- 
2.44.0

