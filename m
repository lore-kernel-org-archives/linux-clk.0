Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530247;
	b=4oVcH6CEGmnkpJYxqsP8juqfmXnRWpzyMlJvtQ5XZXdShcFjnKXBaRCTwNI4LDxz/a3G
	 ryBh0YG6C7ktw6ujzthbC1BkF3uv0Py93mYU2pkJirA5b3F5w9jVLyQ7XkcvNH28hibF8
	 2mSuLUUiv2yRCGtqqjO2VSqWxQlSpXJ5wQrV5p8Pb5e/wuei9zbQbri/KLFQTd0OVh035
	 O0pNEabEucyi11UYu/u0ZjNQTMqtFpf3KGwVUxblZX1C/8Yt7hCH9KQhI8O0ftO4RUYM9
	 GzmyHM1t2QLW8KFvDYQYde3bOFYvR3Q7LDWWteP3U+TtSXxumznljzHcUyNDeWAHVOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
	b=XZkA/2t8TPEJNw093a3Fms5vHEko3QexhW31uYqrf/GiRttRN+Rrdmrgefi9i/iDbWEA
	 M2q+jOjhTdVWDvjbA1V1+64s7vntReaIf3QpliLe3HsoUw1p3QS3bUSvb8XFYJnvvpS5x
	 sKrR25SRniutXuqen9rwhcwI24DXYnPMu6LydilFEyy6meZKVtR1gTjZzb2SJFPH30/9o
	 z4dM9dQph8l/ODLZIAJ22JupF6p1wfvQdqSe+H70tkTBQvOcQbc+pikGdJTEuUrGzY2Tf
	 ux5kESCXKLs2PSH9XR/4T9ytvDlHcrexosud12Kv1LILHePsNijN9zED8nxdU0sKdCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTEz5d3W;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A8606B567
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 00:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97A8606B567
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTEz5d3W
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491aaed7565so135200f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 16:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530245; x=1795135045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
        b=hTEz5d3WaREJ7ysbOywNEF1KN5ZyBCj5690RiF0asHXetT32w34pPUJoObRiJNSims
         XG/c3EOAZP+oTRD8QqudIefWN1UcSGIaxz6drRr2GgcmjRCBctCIqrvj8wEhOk127D1G
         XsCGs856Lwncv613nP7uDgbfZl5yE3c1C9tbQ0pEhsd4Ef1uDeEfSZXQMMe1xbHbXy5u
         XezoQ5cMs9fN0y7kKRhsOKMoI5jtiPIurMEQJ+eZUxYRX2TCoD9vMxto7Pr/c1JjMoCW
         J1zfOk98xReIr+9782nVk1iwv6lHo23M8tOUY+DS4Sop7VIUchrHUWqtWxctxelkW/Fh
         lApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530245; x=1795135045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
        b=i9OGXRhe9Vcwy0dcTP/iaTYUKH3zJMScOKPJZZH3gwzv/P6hWJJEY/gJhiynhgwLnC
         7j+Fazkz4z57PcqC1QjVtOzj2O395SuybkW/noXLhyYI45Cw47n2B89cnddMdGq8NKpD
         0l7NgGqVZIl6edumJIbedRKsaYsoQgOvato8GdFxOkufMGltSTdmZJOhAXTGeI8fqnR/
         qoPihKo+ocgVPXr5b9+T2em0fvB9r94PSRXro0M33uXeOgCCc8HzTpLMarkOVnqLyuc7
         EO7cwlB0OD+PdAmBQEVrq/r5c1ENXOUWUn8geUbXebIVMGvFCPZGvj9pQV5BnBFc7CE1
         wlDA==
X-Forwarded-Encrypted: i=1; AL+hErGh4XNxNiGAVnjsrbA1PHZQUHtQ8jZsggA+cvuXdqhHHtSJsGFKeHFGyO8MGLGloVB3L0MlQt62eBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z86rYTFFUNcoPhFvFLCxEZ+UKbMN/Bg72zN1i8ZRApBv5vj3tSo
	HTAzZ9iV1vJqts7TUxCtBZ7zOm1SxaW4xs0I0ACRjVR8swMdV8GcK5++
X-Gm-Gg: AYBFou0nGyo30ZExSRMBi2Tg3aSKAf6rZVGTbgSzMGP6fjA4PJzmWPvkeCFy8XIxGm3
	L/qqSXmeRq5/vurNvaTAwHjV3PRDsBLr9cpD7EbL0oV+PFEm/BtDiXV19cKQ01uH4T8wEAv+5oe
	bMQTrZ22XZDTqv4Zvn8k+ir3iGaqFNybJXRWtbdor2lbgwQBvsh5pNDnEYdsQjTJk8PRq0Q1Kyd
	hVBQdkX3WFRksq0MnzGj87e6vGW11IjF6dI91Gi4RBQpKNUGLPqHp4QzfT45ydFMAnmJBZBaHon
	eO59JmhqYTEHzU1kO8VcdNjrISzrXYy8Ab4DQ6O9m4T7hxJvN++W9TFtmOLoVT/nC/lIcbHA4V3
	ntvSd83Wlce/4T1lz5ZmEuEj8b8M0n5WpH9LGOJIa+RmffUIcZ1ySO+SDnQWqSzAjLqVUvVpdfZ
	E0la1iZsM6+IrvkYl21oIYcNP8VYgqjfC3zK3C/b0OYqg4W03+0vH/g3NVxEpQplup9xj8GZn7b
	TjGpX7oPFfBtHG5OV2C8RzWXkI6o2mphw21oFtCM+UUZWFNEvDR9/x9/OnQvqAKnhwomLsjcTv8
	rAl+JYtSTokLn63J17bWEoPc6DDYAAELV/icoVugeIhkKzlyPzKEHvsv3q+XNGRfxQW2caeFwMo
	dS/AmBkD1umZdvbfpHr/0dj9wPnMkiQF72QMVpELhjxrpMQS01IlTpLKlsm5e7JKi25gA0HH/8H
	2fACnGyRC8m40nlKON
X-Received: by 2002:a05:6000:1885:b0:499:d9a9:5158 with SMTP id ffacd0b85a97d-49c727d1e47mr2139782f8f.31.1794530245167;
        Thu, 12 Nov 2026 16:37:25 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm2702533f8f.44.2026.11.12.16.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:24 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Fri, 13 Nov 2026 00:37:22 +0000
Message-ID: <20261113003722.3667081-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-misty-lively-galago-693c57@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-5-ghahramani.navid@gmail.com> <20261015-misty-lively-galago-693c57@quoll>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> This is odd. Device is specific, fixed. It either is or is not
> compatible, not both.

Right, the next version drops the syscon compatible from crm2.

> Do not need '|' unless you need to preserve formatting.

Will fix.

> So the PHY does not need any resources from the parent? It gets its own
> clocks? See explanation of simple-mfd.

The next version has no PHY child nodes. The PHY registers are inside
topcrm, so topcrm itself gets #phy-cells.

> Incomplete example.

The next version turns topcrm into an MFD like Stefan's zx297520v3 CRM,
and I will make sure its example is complete.

From your other mail on this patch, none of the subjects in the next
version will have the redundant word bindings.

Best regards,
Navid
