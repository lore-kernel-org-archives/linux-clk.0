Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CFF31F9B5
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 16:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698479; cv=none; b=pgeyOl/WkdVYVQw955kYgwPM59kLDR9ZKGYTRbD1I+ALmyHCTe15cW6IeyEyXzHUAwVEfhApBm6gCiV1FOnNTF1epMVZVXG+/8TJSDAfopeGHJZhKKxX1SyiDxJ+lc1Zt0skcTOy6cwIU8n29ImxZrXJo5kBidGVW0D7ktcYTac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698479; c=relaxed/simple;
	bh=2qKarXk++NiBS2+5AKJidUXBeAghThgQE8g3f72zFz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FdJz6PDxjbihbbrxn0l8YYwDLIig9EhnPTLPj3XywHCIzZUcT3fTizf/AbukAoo/u9RARh27xYqVhxQCr5oR1hL3vxJEUeVl48DbpsDzEsy2Ok8UDGiZzylxpNu9auArdqyocNrVdOrLIrmBzbS81OdSJ4w2g0TW56FyfYvJ95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aG5Z2SzQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+ZPdVGP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aG5Z2SzQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+ZPdVGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790698476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bmtox2s6c4TjZwHbdS6FzVWAuk54pYg3rXVMuHHI2Ts=;
	b=aG5Z2SzQC/L3P5F7SCNx5OHibBjT1L3+e1ygvKwtLYSW5vrMokVF9mNO3cTHJFlXZmNwuV
	9LMkWvIVu/B+LvBuqVqO2tnzZeMnPI1vYshuNuhwQtFTnFkF7byKTne8ZiMOhwx3JzAJpZ
	+ahg790ziPy/2mMvCDwD23xIsqW9KTk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-dyCzhf-ONPWmsep0TUbxZg-1; Tue, 29 Sep 2026 12:14:34 -0400
X-MC-Unique: dyCzhf-ONPWmsep0TUbxZg-1
X-Mimecast-MFC-AGG-ID: dyCzhf-ONPWmsep0TUbxZg_1790698474
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179524bf03so5455916d6.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790698474; x=1791303274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bmtox2s6c4TjZwHbdS6FzVWAuk54pYg3rXVMuHHI2Ts=;
        b=f+ZPdVGPm9TsbOIQjywD6IOf6qQSUfAXBtBpE5Uk1ipp6BdvN8fNxDRZnIeOSL2wv2
         Us+yOE069ntqWlY11lRiTxfTWGECqaTeqPTzpzq0FYwxYx4q0VNFdQpM8+bNRE1QqW6p
         0xGfP9DQVHskfvsQl6aANiXHRgZIDnpemVvpxk7vNFacmEU1Q97ExBDO3Y5PnILJFkqb
         bdUCOVivH6qfH/yfYMSUufzSxAKMudP/Tdi/hGGUogMJgyfMH7+7haOxhsIVRfHAg/SP
         LScf1NMpcV4n6CCTWJ2qNQM4JYmVZKNVy+z6prPm9EKr/ONI4T97jKtFScPMgQP4mF1l
         18cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698474; x=1791303274;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bmtox2s6c4TjZwHbdS6FzVWAuk54pYg3rXVMuHHI2Ts=;
        b=pZ+4kXPoiFU2NjNBe/8KEaUEuJaAVdffXWx+bN5oYr3O3NGbQjn6lRGoppMCFCM2Y8
         AoqGL4RYfexywVN74ba4ue37j7WiGI35IN9u+mgP/8usWaSZMYx6bxz1tTvjfa9FKO0Q
         qqLVWG4OJ3puGRE4+ryNoWL6pGBuRPjAFLWj8WMtxckR0Rngi7IN/ofhq+/29I0GxDRS
         uSXaO0fgRhNM9ZjMPgnP2UOzlEVSZcLoQYqdg3xHP4b7eQZkdvtFh3qwmuAXP4d93k+s
         J+lJfU14fMsss8G6wbpoPAtHkkzqnZIBHJITPaf+Y49y4jtDNi6Dqya8ILGKWG9YVMhk
         okKA==
X-Forwarded-Encrypted: i=1; AKwUvByLU3RRXyWU1Qt4eSKCSe0tCfzLmSb+RtG1sPMbRiUGybddpBOrBI8kcYQWF91HYQzsv3vJylZB7Hw=@vger.kernel.org
X-Gm-Message-State: AFuF++lkM+Z6EN1eTLg8hyCZiggceCI/uvKQyZfsYEKhfw0dV5y8r0KG
	8ogohTcaSSvuV1I57vDMHUfQKRSasRIf+QPUMwVVhq3oetCtxcCZqEXEnVoN32guKD5hyBzcEIN
	a2godvduXJbILdQ8cP2ipwvGp4O5ashvoEuz6RfX+3FxlXq06qpfuPk94DNcVYQ==
X-Gm-Gg: AYBFou1j79H8FZZ84UQTERxhYfXrR/XX8/MoE2ZzjznNcfrJdEQE+MFgAT1ij4HKKyC
	yYfAtJGAnEmTMfxeIqSuXEMn8CXB1EkT+BekbV4R3E3bo8r3huveoq5aX8FptOL5ftQToTLBUtE
	rxxQDDNqmnT9OQtb5mz3hcmBZScW4KWFTRx2VtFC47fkUjIC7wuvg2/3Z6Vq3yyMDfaGiG5DLV8
	jP/rvKvV35GNCGE8BCbewBBLMcRhEIpWqeADJOBmSwiezlXvjcrn+xKRVAFw99Wp9IYf/1ASlVJ
	pVoE9E7LfedRirNO3dyTGsswPPB1YpZBwnTXzK6q4XqjBvsY0lcpMoLgeYaA103SQfztHmtM/NB
	yd+QYeMPHKnanshg8KKoiXcYo33gtrk4o2BeZQktRatW+dkMSNqQ=
X-Received: by 2002:a05:6214:29ce:b0:8ef:4ed2:316 with SMTP id 6a1803df08f44-917819e1cb7mr71156836d6.1.1790698473824;
        Tue, 29 Sep 2026 09:14:33 -0700 (PDT)
X-Received: by 2002:a05:6214:29ce:b0:8ef:4ed2:316 with SMTP id 6a1803df08f44-917819e1cb7mr71154666d6.1.1790698472201;
        Tue, 29 Sep 2026 09:14:32 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d326112sm13448196d6.23.2026.09.29.09.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:14:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Myeonghun Pak <mhun512@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260626094134.71961-1-mhun512@gmail.com>
References: <20260626094134.71961-1-mhun512@gmail.com>
Subject: Re: [PATCH] clk: ti: adpll: unregister OF clock provider on remove
Message-Id: <179069843542.199845.6686423279941894529.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:13:55 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=313; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sd5tjkRycxPIdAX6vTAKeWmD87abOzSi5YgkalY7KF8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2P36w9WTuFvH2Necu/j0fcb/T/q3D86WPc5y4Xz/v+
 7z6nexLq45SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmYv6IkWFO/fmvx1h/80sU
 vGP8/GzNzqPvLtisuyBjGV979unp/z+OMfzhjM7o8re+psN3fuux439enjRm3Vq9w+nHycUx+Yw
 ic6OYAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 26 Jun 2026 18:41:26 +0900, Myeonghun Pak wrote:
> clk: ti: adpll: unregister OF clock provider on remove

Applied, thanks!

[1/1] clk: ti: adpll: unregister OF clock provider on remove
      commit: 4c943ddfc24340f1b899762b1ff35c38306b7a35

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

